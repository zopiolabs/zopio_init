# Contributing to Zopio

Thank you for your interest in contributing to Zopio! We're excited to have you join our community.

## 🚀 Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/zopio_init.git`
3. Create a feature branch: `git checkout -b feat/your-feature-name`
4. Make your changes
5. Push to your fork: `git push origin feat/your-feature-name`
6. Create a Pull Request

## 📋 Contribution Guidelines

### Branch Protection

Our repository has strict branch protection rules:

- **main**: Requires 2 reviews from @zopiolabs/core team, all CI checks must pass
- **develop**: Requires 1 review, all CI checks must pass
- **release/***: Requires 2 reviews, all CI checks must pass
- **v*.***: Version branches require 2 reviews, all CI checks must pass

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
- Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, etc.

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
