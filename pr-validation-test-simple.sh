#!/bin/bash

# Simple PR Validation Test
# Tests key aspects of PR validation workflow

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
TEST_BRANCH=$(git branch --show-current)

echo -e "${YELLOW}=== PR Validation Workflow Test ===${NC}"
echo "Test Branch: $TEST_BRANCH"
echo "Timestamp: $TIMESTAMP"

# Initialize test results
results_file="pr-validation-results-$TIMESTAMP.txt"
echo "PR Validation Test Results - $TIMESTAMP" > "$results_file"
echo "========================================" >> "$results_file"

# Create a test file to commit
echo "Test file for PR validation - $TIMESTAMP" > "test-file-$TIMESTAMP.txt"
git add "test-file-$TIMESTAMP.txt"
git commit -m "test: add test file for PR validation"

# Push the test branch
echo -e "\n${BLUE}Pushing test branch...${NC}"
git push -u origin "$TEST_BRANCH"

# Test 1: Valid PR title with semantic format
echo -e "\n${YELLOW}Test 1: Valid Semantic PR Title${NC}"
echo -e "\nTest 1: Valid Semantic PR Title" >> "$results_file"

pr_output=$(gh pr create \
    --title "test: validate PR workflow" \
    --body "This is a test PR to validate the PR validation workflow" \
    --base develop \
    2>&1)

if echo "$pr_output" | grep -q "github.com.*pull"; then
    pr_url=$(echo "$pr_output" | grep -oE 'https://github.com/[^/]+/[^/]+/pull/[0-9]+')
    pr_number=$(echo "$pr_url" | grep -oE '[0-9]+$')
    echo -e "${GREEN}✓ PR created successfully: #$pr_number${NC}"
    echo "✓ PR created: #$pr_number" >> "$results_file"
    
    # Wait for workflows
    echo "Waiting for workflows to start..."
    sleep 15
    
    # Check PR validation status
    echo -e "\n${BLUE}Checking PR validation status...${NC}"
    checks=$(gh pr checks "$pr_number" --json name,status,conclusion)
    echo "$checks" | jq '.'
    
    # Close PR
    gh pr close "$pr_number" --delete-branch=false
else
    echo -e "${RED}✗ Failed to create PR${NC}"
    echo "✗ Failed to create PR: $pr_output" >> "$results_file"
fi

# Test 2: Invalid PR title (capital letter)
echo -e "\n${YELLOW}Test 2: Invalid PR Title (Capital Letter)${NC}"
echo -e "\nTest 2: Invalid PR Title" >> "$results_file"

# Add another change
echo "Another test line" >> "test-file-$TIMESTAMP.txt"
git add "test-file-$TIMESTAMP.txt"
git commit -m "test: add another line"
git push

pr_output=$(gh pr create \
    --title "Test: Invalid title with capital" \
    --body "This PR should fail validation due to capital letter" \
    --base develop \
    2>&1)

if echo "$pr_output" | grep -q "github.com.*pull"; then
    pr_url=$(echo "$pr_output" | grep -oE 'https://github.com/[^/]+/[^/]+/pull/[0-9]+')
    pr_number=$(echo "$pr_url" | grep -oE '[0-9]+$')
    echo -e "${YELLOW}PR created: #$pr_number - checking validation...${NC}"
    
    sleep 20
    
    # Check if validation failed as expected
    checks=$(gh pr checks "$pr_number" --json name,status,conclusion 2>&1)
    if echo "$checks" | grep -q '"conclusion":"failure"'; then
        echo -e "${GREEN}✓ Validation correctly failed for invalid title${NC}"
        echo "✓ Validation correctly failed" >> "$results_file"
    else
        echo -e "${RED}✗ Validation should have failed but didn't${NC}"
        echo "✗ Validation should have failed" >> "$results_file"
    fi
    
    # Check PR comments for error message
    comments=$(gh pr view "$pr_number" --json comments --jq '.comments[].body' 2>&1)
    if echo "$comments" | grep -q "doesn't match the configured pattern"; then
        echo -e "${GREEN}✓ Correct error message posted${NC}"
    fi
    
    gh pr close "$pr_number" --delete-branch=false
fi

# Test 3: Breaking change with and without documentation
echo -e "\n${YELLOW}Test 3: Breaking Change Documentation${NC}"
echo -e "\nTest 3: Breaking Change" >> "$results_file"

# Test without documentation (should fail)
echo "Breaking change" >> "test-file-$TIMESTAMP.txt"
git add "test-file-$TIMESTAMP.txt"
git commit -m "test: breaking change test"
git push

pr_output=$(gh pr create \
    --title "feat!: breaking API change" \
    --body "This PR has breaking changes but no proper documentation" \
    --base develop \
    2>&1)

if echo "$pr_output" | grep -q "github.com.*pull"; then
    pr_url=$(echo "$pr_output" | grep -oE 'https://github.com/[^/]+/[^/]+/pull/[0-9]+')
    pr_number=$(echo "$pr_url" | grep -oE '[0-9]+$')
    
    sleep 20
    
    # Check for breaking change warning
    comments=$(gh pr view "$pr_number" --json comments --jq '.comments[].body' 2>&1)
    if echo "$comments" | grep -q "Breaking Change Detected"; then
        echo -e "${GREEN}✓ Breaking change warning posted${NC}"
        echo "✓ Breaking change warning posted" >> "$results_file"
    else
        echo -e "${RED}✗ No breaking change warning${NC}"
        echo "✗ No breaking change warning" >> "$results_file"
    fi
    
    gh pr close "$pr_number" --delete-branch=false
fi

# Test 4: PR Size validation
echo -e "\n${YELLOW}Test 4: PR Size Validation${NC}"
echo -e "\nTest 4: PR Size" >> "$results_file"

# Create a reasonably sized change
for i in {1..10}; do
    echo "Line $i of test content" >> "size-test-$i.txt"
    git add "size-test-$i.txt"
done
git commit -m "test: add files for size test"
git push

pr_output=$(gh pr create \
    --title "test: pr size validation" \
    --body "Testing PR size limits" \
    --base develop \
    2>&1)

if echo "$pr_output" | grep -q "github.com.*pull"; then
    pr_url=$(echo "$pr_output" | grep -oE 'https://github.com/[^/]+/[^/]+/pull/[0-9]+')
    pr_number=$(echo "$pr_url" | grep -oE '[0-9]+$')
    
    sleep 15
    
    # Check for size check comment
    comments=$(gh pr view "$pr_number" --json comments --jq '.comments[].body' 2>&1)
    if echo "$comments" | grep -q "PR Size Check"; then
        echo -e "${GREEN}✓ PR size check executed${NC}"
        echo "✓ PR size check executed" >> "$results_file"
    fi
    
    gh pr close "$pr_number" --delete-branch=false
fi

# Summary
echo -e "\n${YELLOW}=== Test Summary ===${NC}"
echo -e "\nTest Summary:" >> "$results_file"
echo "Test results saved to: $results_file"
cat "$results_file"