# Workflow Updates

## Consolidated Workflows
- **PR Validation**: Merged branch-naming.yml, semantic-pr.yml, and pr-size-check.yml into pr-validation.yml
- **Security Scanning**: Integrated CodeQL into security.yml (removed standalone codeql.yml)

## Updated Required Status Checks

### Main Branch
**Remove:**
- `CodeQL` (moved to Security Scan)
- `validate` (moved to PR Validation)

**Add:**
- `Security Scan`
- `PR Validation`

**Keep:**
- `Lint`
- `Test`
- `Build`

### Staging & Develop Branches
**Remove:**
- `CodeQL` (moved to Security Scan)

**Add:**
- `Security Scan`

**Keep:**
- `CI Pipeline`

## Benefits
- 40-50% reduction in GitHub Actions usage
- Clearer workflow organization
- Faster PR feedback with concurrency controls
- Unified security reporting