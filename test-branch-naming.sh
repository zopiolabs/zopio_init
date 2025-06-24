#!/bin/bash

# Branch Naming Convention Test Script
# Tests branch naming validation in PR workflow

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test tracking
declare -A branch_test_results
branch_test_count=0
branch_pass_count=0
branch_fail_count=0

# Starting branch
ORIGINAL_BRANCH=$(git branch --show-current)
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

echo -e "${YELLOW}=== Branch Naming Convention Tests ===${NC}"
echo "Starting from branch: $ORIGINAL_BRANCH"

# Function to log branch test results
log_branch_test() {
    local branch_name=$1
    local expected=$2
    local actual=$3
    local details=$4
    
    branch_test_count=$((branch_test_count + 1))
    
    if [ "$expected" == "$actual" ]; then
        echo -e "${GREEN}✓ $branch_name (expected: $expected)${NC}"
        branch_test_results["$branch_name"]="PASS|$details"
        branch_pass_count=$((branch_pass_count + 1))
    else
        echo -e "${RED}✗ $branch_name (expected: $expected, got: $actual)${NC}"
        echo -e "  Details: $details"
        branch_test_results["$branch_name"]="FAIL|$details"
        branch_fail_count=$((branch_fail_count + 1))
    fi
}

# Function to test a branch name
test_branch_name() {
    local branch_name=$1
    local expected_result=$2  # "valid" or "invalid"
    
    echo -e "\n${BLUE}Testing branch: $branch_name${NC}"
    
    # Create and switch to the test branch
    git checkout -b "$branch_name" 2>/dev/null
    
    if [ $? -ne 0 ]; then
        log_branch_test "$branch_name" "$expected_result" "error" "Failed to create branch"
        return
    fi
    
    # Create a test file
    echo "Test content for $branch_name" > "test-$TIMESTAMP.txt"
    git add "test-$TIMESTAMP.txt"
    git commit -m "test: add test file for branch $branch_name" >/dev/null 2>&1
    
    # Push the branch
    git push -u origin "$branch_name" >/dev/null 2>&1
    
    # Try to create a PR and capture validation result
    pr_output=$(gh pr create \
        --title "test: validate branch $branch_name" \
        --body "Testing branch naming convention for: $branch_name" \
        --base develop \
        2>&1)
    
    pr_created=false
    pr_number=""
    
    if echo "$pr_output" | grep -q "github.com.*pull"; then
        pr_created=true
        pr_url=$(echo "$pr_output" | grep -oE 'https://github.com/[^/]+/[^/]+/pull/[0-9]+' | head -1)
        pr_number=$(echo "$pr_url" | grep -oE '[0-9]+$')
    fi
    
    if [ "$pr_created" = true ]; then
        # PR was created, wait for validation
        echo "PR created, checking validation status..."
        sleep 20
        
        # Check if the branch validation passed
        checks_output=$(gh pr checks "$pr_number" --json name,conclusion 2>&1)
        
        if echo "$checks_output" | grep -q "PR Validation"; then
            if echo "$checks_output" | grep -q '"conclusion":"failure"'; then
                # Get the actual error from PR comments
                comments=$(gh pr view "$pr_number" --json comments --jq '.comments[].body' 2>&1)
                if echo "$comments" | grep -q "does not follow naming conventions"; then
                    validation_result="invalid"
                    details="Branch name validation correctly failed"
                else
                    validation_result="valid"
                    details="Branch name validation passed"
                fi
            else
                validation_result="valid"
                details="Branch name validation passed"
            fi
        else
            validation_result="unknown"
            details="Could not determine validation status"
        fi
        
        # Close the PR
        gh pr close "$pr_number" --delete-branch=false >/dev/null 2>&1
        
        log_branch_test "$branch_name" "$expected_result" "$validation_result" "$details"
    else
        # PR creation failed - might be due to branch naming
        if echo "$pr_output" | grep -q "does not follow naming conventions"; then
            log_branch_test "$branch_name" "$expected_result" "invalid" "Branch name rejected at PR creation"
        else
            log_branch_test "$branch_name" "$expected_result" "error" "PR creation failed: $pr_output"
        fi
    fi
    
    # Clean up - go back to original branch and delete test branch
    git checkout "$ORIGINAL_BRANCH" >/dev/null 2>&1
    git branch -D "$branch_name" >/dev/null 2>&1
    git push origin --delete "$branch_name" >/dev/null 2>&1
}

# Test valid branch names
echo -e "\n${YELLOW}Testing Valid Branch Names:${NC}"

valid_branches=(
    "feat/test-feature-$TIMESTAMP"
    "feature/another-test-$TIMESTAMP"
    "fix/bug-123-$TIMESTAMP"
    "hotfix/critical-$TIMESTAMP"
    "release/v1.0.0"
    "docs/update-$TIMESTAMP"
    "chore/deps-$TIMESTAMP"
    "test/coverage-$TIMESTAMP"
    "refactor/code-$TIMESTAMP"
    "ci/workflow-$TIMESTAMP"
    "build/optimize-$TIMESTAMP"
    "perf/speed-$TIMESTAMP"
    "style/format-$TIMESTAMP"
    "revert/change-$TIMESTAMP"
)

for branch in "${valid_branches[@]}"; do
    test_branch_name "$branch" "valid"
done

# Test invalid branch names
echo -e "\n${YELLOW}Testing Invalid Branch Names:${NC}"

invalid_branches=(
    "random-branch-$TIMESTAMP"
    "my-feature-$TIMESTAMP"
    "features/test-$TIMESTAMP"
    "fixes/bug-$TIMESTAMP"
    "release/1.0.0"
    "release/v1.0"
    "Feature/test-$TIMESTAMP"
    "FEAT/test-$TIMESTAMP"
)

for branch in "${invalid_branches[@]}"; do
    test_branch_name "$branch" "invalid"
done

# Summary
echo -e "\n${YELLOW}=== Branch Naming Test Summary ===${NC}"
echo "Total Tests: $branch_test_count"
echo -e "${GREEN}Passed: $branch_pass_count${NC}"
echo -e "${RED}Failed: $branch_fail_count${NC}"
echo "Success Rate: $(( branch_pass_count * 100 / branch_test_count ))%"

# Save results
cat > "branch-naming-test-report-$TIMESTAMP.json" <<EOF
{
  "timestamp": "$TIMESTAMP",
  "test_type": "branch_naming_validation",
  "summary": {
    "total_tests": $branch_test_count,
    "passed": $branch_pass_count,
    "failed": $branch_fail_count,
    "success_rate": $(( branch_pass_count * 100 / branch_test_count ))
  },
  "results": [
$(
    first=true
    for branch_name in "${!branch_test_results[@]}"; do
        IFS='|' read -r result details <<< "${branch_test_results[$branch_name]}"
        if [ "$first" = false ]; then echo ","; fi
        echo -n "    {\"branch\": \"$branch_name\", \"result\": \"$result\", \"details\": \"$details\"}"
        first=false
    done
)
  ]
}
EOF

echo -e "\n${GREEN}Report saved to: branch-naming-test-report-$TIMESTAMP.json${NC}"