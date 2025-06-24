# Test Scenarios for Label.yml Workflow

## Workflow Under Test
- **File**: `.github/workflows/label.yml`
- **Type**: PR automation workflow
- **Trigger**: `pull_request_target` [opened, synchronize]
- **Purpose**: Auto-labeling PRs

## Test Scenarios Matrix

### 1. Success Scenarios (Should Pass)

#### S1: File Path-Based Labeling
- **Test**: Create PR with changes to frontend files
- **Files**: `apps/web/src/components/Button.tsx`
- **Expected**: Frontend label applied based on labeler.yml config
- **Validation**: Check PR has appropriate path-based labels

#### S2: PR Title Type Detection
- **Test**: Create PR with conventional commit title
- **Titles to test**:
  - `feat: add new dashboard component`
  - `fix: resolve login issue`
  - `docs: update API documentation`
  - `chore: update dependencies`
- **Expected**: Corresponding type labels applied
- **Validation**: Verify type labels match title prefix

#### S3: Breaking Change Detection
- **Test**: Create PR with breaking change indicator
- **Titles**: 
  - `feat!: redesign authentication API`
  - `fix(api): breaking change in response format`
- **Expected**: `breaking change` label applied
- **Validation**: Check for breaking change label

#### S4: Community Contribution
- **Test**: Create PR from non-org member
- **Author**: External contributor (not in zopiolabs org)
- **Expected**: `community contribution` label applied
- **Validation**: Verify label only on external PRs

#### S5: Multiple Label Application
- **Test**: PR that triggers multiple labeling rules
- **Setup**: Frontend files + `feat:` title + external contributor
- **Expected**: All applicable labels applied
- **Validation**: Check for multiple labels

### 2. Failure Scenarios (Should Handle Gracefully)

#### F1: Invalid PR Title Format
- **Test**: PR with non-conventional title
- **Title**: `Update stuff in the app`
- **Expected**: No type label applied, workflow continues
- **Validation**: No errors, just missing type label

#### F2: No File Changes
- **Test**: PR with only title/description changes
- **Expected**: No path-based labels, only title-based if applicable
- **Validation**: Workflow completes without path labels

#### F3: Organization Member PR
- **Test**: PR from org member
- **Author**: Member of zopiolabs
- **Expected**: No `community contribution` label
- **Validation**: Verify label is NOT applied

#### F4: Missing Labeler Config
- **Test**: Reference to non-existent label in labeler.yml
- **Expected**: Graceful handling, other labels still applied
- **Validation**: Check logs for warnings but no failure

### 3. Edge Cases

#### E1: PR Title with Multiple Prefixes
- **Test**: Title with nested scopes
- **Title**: `feat(auth): fix(login): resolve OAuth issue`
- **Expected**: First valid prefix wins (`type: feature`)
- **Validation**: Only one type label applied

#### E2: Case Sensitivity
- **Test**: Uppercase prefix in title
- **Title**: `FEAT: Add new feature`
- **Expected**: No label (lowercase required)
- **Validation**: Verify case sensitivity

#### E3: Concurrent Label Updates
- **Test**: Rapid PR updates triggering multiple workflow runs
- **Action**: Push multiple commits quickly
- **Expected**: Concurrency control prevents conflicts
- **Validation**: Latest run wins, no duplicate labels

#### E4: Special Characters in Title
- **Test**: PR title with special characters
- **Title**: `feat: add support for @ and # symbols`
- **Expected**: Normal label application
- **Validation**: Special chars don't break parsing

#### E5: Very Long PR Title
- **Test**: PR title exceeding typical length
- **Title**: `feat: ` + 200 character description
- **Expected**: Label still applied correctly
- **Validation**: Title length doesn't affect labeling

## Implementation Plan

### Phase 1: Setup Test Environment
1. Create test files in different directories
2. Prepare PR templates for each scenario
3. Set up test user (non-org member) if possible

### Phase 2: Execute Tests
1. Create PRs for each scenario
2. Monitor workflow runs
3. Capture results and logs

### Phase 3: Validation
1. Check applied labels via GitHub API
2. Review workflow logs for errors/warnings
3. Document actual vs expected behavior

## Expected Outcomes

### Critical Success Factors
- All success scenarios result in correct labels
- Failure scenarios don't crash the workflow
- Edge cases are handled gracefully
- Concurrency control prevents race conditions

### Performance Metrics
- Workflow execution time < 60 seconds
- No timeout errors
- Successful completion rate > 95%