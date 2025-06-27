# Git Hooks Configuration

This project uses Git hooks to maintain code quality and enforce standards before code reaches the repository.

## Overview

We use the following tools:
- **Husky**: Git hooks manager
- **lint-staged**: Run linters on staged files only  
- **commitlint**: Enforce conventional commit messages
- **Custom scripts**: Secret detection and branch validation

## Pre-commit Hook

Runs on every commit to check staged files:

### Checks performed:
1. **Linting** (`pnpm lint --changed-files`)
   - Enforces code style using Biome
   - Only checks modified files

2. **Type Checking** (`pnpm typecheck`)
   - Ensures TypeScript types are correct
   - Runs on the entire project

3. **Formatting** (`pnpm format --changed-files`)
   - Auto-formats JSON and Markdown files
   - Uses Biome formatter

4. **Secret Detection** (`node scripts/detect-secrets.js`)
   - Scans for API keys, passwords, tokens
   - Prevents accidental credential commits

5. **Dependency Validation**
   - Checks package.json changes for issues
   - Validates lockfile integrity

6. **Prisma Schema**
   - Regenerates Prisma client on schema changes

## Commit-msg Hook

Validates commit message format using commitlint.

### Required format:
```
type(scope): subject

[optional body]

[optional footer(s)]
```

### Valid types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Test additions/changes
- `build`: Build system changes
- `ci`: CI configuration changes
- `chore`: Other changes
- `revert`: Revert commits
- `release`: Release commits

### Valid scopes:
See `commitlint.config.js` for the full list. Examples:
- `api`, `app`, `auth`, `cli`, `crud`, `database`, `ui`, etc.

### Examples:
```bash
# Valid commits
git commit -m "feat(auth): add two-factor authentication"
git commit -m "fix(crud): resolve pagination issue in data table"
git commit -m "docs(cli): update installation instructions"

# Invalid commits (will be rejected)
git commit -m "Updated stuff"  # No type/scope
git commit -m "FEAT(auth): add login"  # Uppercase type
git commit -m "feat(auth): Add login"  # Uppercase subject start
```

## Pre-push Hook

Runs comprehensive checks before pushing to remote:

### Checks performed:
1. **Branch Name Validation**
   - Ensures branch follows naming conventions
   - Valid patterns:
     - Feature branches: `feat/*`, `fix/*`, `docs/*`, etc.
     - Release branches: `release/*`, `hotfix/*`
     - Main branches: `develop`, `staging`, `main`

2. **Full Test Suite** (`pnpm test`)
   - Runs all unit and integration tests
   - Ensures no regressions

3. **Full Build** (`pnpm build`)
   - Verifies the entire monorepo builds
   - Catches build-breaking changes

4. **Type Checking** (`pnpm typecheck`)
   - Full TypeScript validation
   - Ensures type safety

5. **Bundle Analysis** (optional)
   - Checks bundle sizes
   - Informational only (non-blocking)

## Bypassing Hooks

In emergency situations, you can bypass hooks:

```bash
# Skip pre-commit and commit-msg hooks
git commit --no-verify -m "emergency: fix critical bug"

# Skip pre-push hook
git push --no-verify
```

**⚠️ Use with caution!** Bypassing hooks can lead to:
- Broken builds in CI
- Code style inconsistencies  
- Security vulnerabilities
- Failed deployments

## Troubleshooting

### Hook not running
```bash
# Reinstall hooks
pnpm prepare
```

### Permission denied
```bash
# Make hooks executable
chmod +x .husky/*
```

### Lint-staged issues
```bash
# Clear cache
rm -rf node_modules/.cache/lint-staged
```

### Tests taking too long
The pre-push hook runs full tests. For faster commits:
1. Use pre-commit hook only (incremental checks)
2. Let CI run full tests
3. Run tests manually before pushing

## Local Development Tips

1. **Commit frequently**: Pre-commit hooks are fast
2. **Use conventional commits**: Helps with changelog generation
3. **Run checks manually**: `pnpm lint`, `pnpm test` before committing
4. **Fix issues early**: Don't accumulate linting errors

## CI Integration

These hooks complement our CI pipeline:
- **Local hooks**: Fast, incremental checks
- **CI pipeline**: Comprehensive validation
- **Both**: Ensure code quality at every stage

## Known Issues

### TypeScript Errors
There are existing TypeScript errors in some packages (particularly `packages/crud/ui/auto/fieldComponentMap.ts`) that need to be resolved. The pre-push hook has TypeScript checking temporarily disabled until these are fixed.

**TODO**: 
1. Fix TypeScript configuration to properly handle JSX in `.ts` files or rename affected files to `.tsx`
2. Resolve syntax errors in `fieldComponentMap.ts`
3. Re-enable TypeScript checking in the pre-push hook by uncommenting the `exit 1` line