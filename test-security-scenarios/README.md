# Security Workflow Test Scenarios

This directory contains test files for validating the GitHub Security Scan workflow behavior.

## Test Files

1. **vulnerable-package.json** - Contains known vulnerable dependencies for Trivy testing
2. **test-secrets.js** - Contains fake secrets for TruffleHog testing
3. **insecure-code.js** - Contains security vulnerabilities for Semgrep testing
4. **test-dockerfile** - Docker configuration for container scan testing

## Test Execution

These files are used to validate:
- Workflow triggers on different branches
- Security scan detection capabilities
- SARIF upload functionality
- Build failure on critical issues

**Note**: All secrets and vulnerabilities in this directory are intentional test cases and contain no real sensitive data.