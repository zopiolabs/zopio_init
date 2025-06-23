# Documentation Only Change

This file is used to test that the security workflow correctly ignores documentation-only changes.

According to the workflow configuration, changes to the following paths should NOT trigger the security scan:
- `**/*.md`
- `docs/**`
- `.github/*.md`
- `.github/ISSUE_TEMPLATE/**`
- `.github/PULL_REQUEST_TEMPLATE.md`
- `LICENSE`
- `CHANGELOG.md`
- `README.md`
- `**/*.txt`

This test validates that path-ignore functionality works as expected.