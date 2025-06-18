# Contributing to Zopio

Thank you for your interest in contributing to Zopio! We're excited to have you join our community.

## 🚀 Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/zopio_init.git`
3. Add upstream remote: `git remote add upstream https://github.com/zopiolabs/zopio.git`
4. Create a feature branch: `git checkout -b feat/your-feature-name`
5. Make your changes
6. Push to your fork: `git push origin feat/your-feature-name`
7. Create a Pull Request

## 🌳 Branching Strategy

We follow a modified GitFlow branching model:

### Core Branches
- **main**: Production-ready code (protected, 2 reviews required from @zopiolabs/core)
- **develop**: Integration branch for features (protected, 1 review required)
- **staging**: Pre-production testing (protected, 1 review required)

### Supporting Branches
- **feat/\***: New features (create from develop, merge to develop)
- **release/\***: Release preparation (create from develop, merge to main and develop)
- **hotfix/\***: Emergency fixes (create from main, merge to main and develop)
- **docs/\***: Documentation updates (create from develop, merge to develop)

### Branch Naming Convention
- Features: `feat/descriptive-name`
- Releases: `release/v1.2.0`
- Hotfixes: `hotfix/critical-fix`
- Documentation: `docs/update-xyz`

### Merge Strategies
- **feat/\* → develop**: Squash and merge (preferred)
- **develop → staging**: Merge commit
- **release/\* → main**: Merge commit
- **hotfix/\* → main**: Merge commit

For detailed branch information, see [.github/BRANCHES.md](.github/BRANCHES.md)

## 📋 Contribution Guidelines

### Branch Protection

Our repository enforces strict branch protection rules:

- **main**: 
  - Requires 2 reviews from @zopiolabs/core team
  - All CI checks must pass (build, test, lint, security/codeql)
  - No direct pushes (including admins)
  - Restricted to @zopiolabs/core team
  
- **develop**: 
  - Requires 1 review
  - All CI checks must pass (build, test, lint)
  - No direct pushes (including admins)
  
- **staging**: 
  - Requires 1 review
  - All CI checks must pass (build, test, lint)
  - No direct pushes (including admins)

All protected branches require:
- Up-to-date branches before merging
- Conversation resolution before merging
- Passing status checks

### Pull Request Requirements

1. **Code Review**: All PRs require review from @zopiolabs/core team members
2. **CI Checks**: The following checks must pass:
   - `build`: Project must build successfully
   - `test`: All tests must pass
   - `lint`: Code must pass linting
   - `security/codeql`: Security scan must pass

3. **PR Size Limits**:
   - Soft limit: 500 lines changed (warning)
   - Hard limit: 2000 lines changed (will fail)
   - Maximum 50 files per PR

4. **CODEOWNERS**: Changes to critical paths require review from @zopiolabs/core

### Code Style

- Follow the existing code style
- Run `pnpm lint` before committing
- Write clear, descriptive commit messages
- Use conventional commits format

### Commit Message Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, missing semicolons, etc)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `build`: Build system or dependency updates
- `ci`: CI/CD changes
- `chore`: Other changes
- `revert`: Reverting commits

**Examples:**
```bash
feat(auth): add OAuth2 GitHub provider
fix(api): prevent race condition in transactions
docs: update API documentation
chore(deps): update dependencies
```

### Testing

- Write tests for new features
- Ensure all existing tests pass
- Aim for high test coverage

### Security

- Never commit sensitive data
- Report security vulnerabilities privately to security@zopio.com
- Dependencies are automatically updated by Dependabot

## 🔒 Security Policy

If you discover a security vulnerability, please email security@zopio.com instead of creating a public issue.

## 📄 License

By contributing to Zopio, you agree that your contributions will be licensed under the project's license.

## 🤝 Community

- Be respectful and inclusive
- Help others in issues and discussions
- Follow our Code of Conduct

Thank you for contributing to Zopio! 🎉
