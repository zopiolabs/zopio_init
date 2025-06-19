# CI Workflow Test

This file is created to test the ci.yml GitHub Actions workflow.

## Test Objective
Verify that the CI workflow correctly:
- ✅ Sets up dependencies with frozen lockfile
- ✅ Runs linting with Biome
- ✅ Executes test suite with Vitest  
- ✅ Builds all packages
- ✅ Performs CodeQL security analysis

## Expected Behavior
When this PR is created targeting the develop branch:
1. The CI workflow should trigger automatically
2. All jobs (setup, lint, test, build, security) should run
3. Jobs should execute in parallel where possible
4. The workflow should complete successfully

## Workflow Jobs
- **Setup**: Install dependencies
- **Lint**: Code quality checks
- **Test**: Unit and integration tests
- **Build**: Compile all packages
- **Security**: CodeQL analysis

## Notes
- This is a temporary test file
- Will be removed after workflow verification
- The workflow uses Node.js 20 LTS and pnpm 10.11.0
