# Welcome Workflow Test Scenarios

## Workflow Details
- **File**: `.github/workflows/welcome.yml`
- **Type**: Automation workflow for first-time contributors
- **Triggers**: 
  - `pull_request_target` (types: opened)
  - `issues` (types: opened)

## Test Scenarios

### 1. Success Scenarios

#### S1: First Issue - New Contributor
**Test**: Create first issue from a user who has never contributed
**Expected**: Welcome message posted with links to contributing guidelines
**Validation**:
- Message includes @mention of user
- Contains link to CONTRIBUTING.md
- Points to GitHub Discussions
- Mentions label assignment

#### S2: First PR - New Contributor
**Test**: Create first PR from a user who has never contributed
**Expected**: Welcome message posted with PR-specific guidance
**Validation**:
- Message includes @mention of user
- Contains checklist of next steps
- Links to branch strategy and conventional commits
- Mentions automatic contributor addition

#### S3: PR from Fork
**Test**: Create PR from a forked repository (uses pull_request_target)
**Expected**: Workflow runs and posts welcome message
**Validation**:
- Workflow has permission to comment on fork PR
- Message posts successfully

### 2. Failure Scenarios

#### F1: Second Issue - Existing Contributor
**Test**: Create issue from user who already has an issue
**Expected**: No welcome message posted
**Validation**:
- Workflow runs but first-interaction action skips
- No duplicate welcome messages

#### F2: Second PR - Existing Contributor
**Test**: Create PR from user who already has a PR
**Expected**: No welcome message posted
**Validation**:
- Workflow runs but first-interaction action skips
- No duplicate welcome messages

#### F3: Bot Account
**Test**: Create issue/PR from a bot account (e.g., dependabot)
**Expected**: No welcome message posted
**Validation**:
- Workflow may run but should not post to bot accounts

### 3. Edge Cases

#### E1: Simultaneous First Contributions
**Test**: User creates issue and PR at nearly the same time
**Expected**: Both get welcome messages (different content)
**Validation**:
- Issue gets issue-specific message
- PR gets PR-specific message
- No race condition issues

#### E2: Deleted First Contribution
**Test**: User's first issue/PR was deleted, then creates new one
**Expected**: Depends on GitHub's first-interaction tracking
**Validation**:
- Document actual behavior
- Verify if deleted contributions still count

#### E3: Draft PR
**Test**: Create draft PR as first contribution
**Expected**: No welcome message (trigger is on 'opened', not draft)
**Validation**:
- Workflow doesn't trigger on draft PRs
- Message posts when draft is marked ready

### 4. Workflow Configuration Tests

#### C1: GITHUB_TOKEN Permissions
**Test**: Verify GITHUB_TOKEN has required permissions
**Expected**: Token can post comments on issues and PRs
**Validation**:
- Check workflow permissions in repo settings
- Verify pull_request_target allows commenting

#### C2: Action Version
**Test**: Verify actions/first-interaction@v1 is available
**Expected**: Action runs without errors
**Validation**:
- No deprecation warnings
- Action executes successfully

### 5. Message Content Tests

#### M1: Issue Message Variables
**Test**: Verify all variables in issue message render correctly
**Expected**: @mention and links work properly
**Validation**:
- `@${{ github.actor }}` renders as clickable mention
- All markdown links are valid
- Message formatting is correct

#### M2: PR Message Variables
**Test**: Verify all variables in PR message render correctly
**Expected**: @mention and links work properly
**Validation**:
- `@${{ github.actor }}` renders as clickable mention
- All markdown links are valid
- Message formatting is correct

### 6. Branch-Specific Behavior

#### B1: PR to main branch
**Test**: First PR targeting main branch
**Expected**: Welcome message posts (no branch-specific filtering)
**Validation**:
- Message posts regardless of target branch

#### B2: PR to develop branch
**Test**: First PR targeting develop branch
**Expected**: Welcome message posts
**Validation**:
- Message posts regardless of target branch

#### B3: PR to feature branch
**Test**: First PR targeting feature/* branch
**Expected**: Welcome message posts
**Validation**:
- Message posts regardless of target branch

## Test Implementation Plan

1. Create test accounts that have never interacted with the repo
2. Use GitHub CLI to create issues and PRs
3. Verify workflow runs using GitHub Actions API
4. Check for comment presence using GitHub API
5. Document actual vs expected behavior
6. Test with multiple scenarios in sequence

## GitHub CLI Commands

```bash
# Create issue
gh issue create --title "Test Issue" --body "Testing welcome workflow"

# Create PR
gh pr create --title "Test PR" --body "Testing welcome workflow" --base develop

# Check workflow runs
gh run list --workflow=welcome.yml

# Check issue comments
gh issue view <number> --comments

# Check PR comments  
gh pr view <number> --comments
```