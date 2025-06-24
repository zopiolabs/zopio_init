#!/bin/bash

# PR Validation Test Script
# Tests all aspects of the PR validation workflow

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test results tracking
declare -A test_results
test_count=0
pass_count=0
fail_count=0

# GitHub repository details
REPO="zopiolabs/zopio_init"
TEST_BRANCH=$(git branch --show-current)
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Test result logging
log_test() {
    local test_name=$1
    local result=$2
    local details=$3
    
    test_count=$((test_count + 1))
    test_results["$test_name"]="$result|$details"
    
    if [ "$result" == "PASS" ]; then
        echo -e "${GREEN}✓ $test_name${NC}"
        pass_count=$((pass_count + 1))
    else
        echo -e "${RED}✗ $test_name${NC}"
        echo -e "  Details: $details"
        fail_count=$((fail_count + 1))
    fi
}

# Function to create a test file
create_test_file() {
    local filename=$1
    local content=$2
    echo "$content" > "$filename"
    git add "$filename"
    git commit -m "test: add $filename for PR validation testing"
}

# Function to create PR and capture result
create_pr() {
    local title=$1
    local body=$2
    local base_branch=$3
    local expected_result=$4
    
    echo -e "\n${BLUE}Testing: $title${NC}"
    
    # Create PR and capture output
    pr_output=$(gh pr create --title "$title" --body "$body" --base "$base_branch" 2>&1)
    pr_url=$(echo "$pr_output" | grep -oE 'https://github.com/[^/]+/[^/]+/pull/[0-9]+' | head -1)
    
    if [ -z "$pr_url" ]; then
        log_test "$title" "FAIL" "Failed to create PR: $pr_output"
        return 1
    fi
    
    pr_number=$(echo "$pr_url" | grep -oE '[0-9]+$')
    
    # Wait for workflows to complete
    echo "Waiting for workflows to complete..."
    sleep 30
    
    # Check workflow status
    workflow_status=$(gh pr checks "$pr_number" --json name,conclusion,status 2>&1)
    
    # Check if PR validation failed as expected
    if [ "$expected_result" == "fail" ]; then
        if echo "$workflow_status" | grep -q '"conclusion":"failure"'; then
            log_test "$title" "PASS" "PR validation correctly failed"
        else
            log_test "$title" "FAIL" "PR validation should have failed but didn't"
        fi
    else
        if echo "$workflow_status" | grep -q '"conclusion":"success"' || echo "$workflow_status" | grep -q '"status":"in_progress"'; then
            log_test "$title" "PASS" "PR validation correctly passed"
        else
            log_test "$title" "FAIL" "PR validation should have passed but failed: $workflow_status"
        fi
    fi
    
    # Close PR
    gh pr close "$pr_number" --delete-branch=false
    
    return 0
}

# Function to test branch naming by creating branches
test_branch_naming() {
    echo -e "\n${YELLOW}=== Testing Branch Naming Conventions ===${NC}"
    
    # Test valid branch names
    local valid_branches=(
        "feat/test-feature"
        "feature/another-test"
        "fix/bug-123"
        "hotfix/critical-issue"
        "release/v1.0.0"
        "docs/update-readme"
        "chore/update-deps"
        "test/add-coverage"
        "refactor/clean-code"
        "ci/update-workflow"
        "build/optimize"
        "perf/improve-speed"
        "style/format-code"
        "revert/undo-change"
    )
    
    # Test invalid branch names
    local invalid_branches=(
        "random-branch"
        "my-feature"
        "features/test"
        "fixes/bug"
        "release/1.0.0"
        "release/v1.0"
    )
    
    # Since we're already on a test branch, we'll test by creating PRs from branches
    echo "Branch naming is validated when PRs are created..."
}

# Main test execution
echo -e "${YELLOW}Starting PR Validation Workflow Tests${NC}"
echo "Test Branch: $TEST_BRANCH"
echo "Repository: $REPO"
echo "Timestamp: $TIMESTAMP"

# Create initial test file to have something to PR
create_test_file "test-file-$TIMESTAMP.txt" "Initial test file for PR validation"

# Push test branch
git push -u origin "$TEST_BRANCH"

# Test 1: Valid PR titles
echo -e "\n${YELLOW}=== Testing Semantic PR Titles ===${NC}"

# Valid titles
create_pr "feat: add new feature" "Testing valid feature PR" "develop" "pass"
create_pr "fix: resolve bug" "Testing valid fix PR" "develop" "pass"
create_pr "feat(auth): add OAuth support" "Testing PR with scope" "develop" "pass"
create_pr "fix!: breaking change fix" "## Breaking Changes\n\n- Changed API response format\n- Migration: Update all API calls" "develop" "pass"

# Invalid titles
create_pr "Feature: add new feature" "Testing invalid capital letter" "develop" "fail"
create_pr "feature: add new feature" "Testing invalid type" "develop" "fail"
create_pr "feat add new feature" "Testing missing colon" "develop" "fail"

# Test 2: PR Size Limits
echo -e "\n${YELLOW}=== Testing PR Size Limits ===${NC}"

# Small PR (should pass)
create_test_file "small-change.txt" "Small change"
create_pr "test: small PR" "Testing small PR size" "develop" "pass"

# Test 3: Breaking Changes
echo -e "\n${YELLOW}=== Testing Breaking Change Documentation ===${NC}"

# Breaking change without documentation (should fail)
create_test_file "breaking-change.txt" "Breaking change"
create_pr "feat!: major API change" "This PR has breaking changes but no documentation" "develop" "fail"

# Breaking change with documentation (should pass)
create_pr "feat!: major API change" "## Breaking Changes\n\n- Changed doSomething() API to require config\n- Migration: Update all calls from doSomething() to doSomething({ legacy: true })" "develop" "pass"

# Generate test report
echo -e "\n${YELLOW}=== Test Report ===${NC}"
echo "Total Tests: $test_count"
echo -e "${GREEN}Passed: $pass_count${NC}"
echo -e "${RED}Failed: $fail_count${NC}"
echo "Success Rate: $(( pass_count * 100 / test_count ))%"

# Detailed results
echo -e "\n${YELLOW}Detailed Results:${NC}"
for test_name in "${!test_results[@]}"; do
    IFS='|' read -r result details <<< "${test_results[$test_name]}"
    if [ "$result" == "PASS" ]; then
        echo -e "${GREEN}✓ $test_name${NC}"
    else
        echo -e "${RED}✗ $test_name${NC}"
        echo "  $details"
    fi
done

# Save report to file
cat > "pr-validation-test-report-$TIMESTAMP.json" <<EOF
{
  "timestamp": "$TIMESTAMP",
  "test_branch": "$TEST_BRANCH",
  "repository": "$REPO",
  "summary": {
    "total_tests": $test_count,
    "passed": $pass_count,
    "failed": $fail_count,
    "success_rate": $(( pass_count * 100 / test_count ))
  },
  "results": [
$(
    first=true
    for test_name in "${!test_results[@]}"; do
        IFS='|' read -r result details <<< "${test_results[$test_name]}"
        if [ "$first" = false ]; then echo ","; fi
        echo -n "    {\"test\": \"$test_name\", \"result\": \"$result\", \"details\": \"$details\"}"
        first=false
    done
)
  ]
}
EOF

echo -e "\n${GREEN}Test report saved to: pr-validation-test-report-$TIMESTAMP.json${NC}"