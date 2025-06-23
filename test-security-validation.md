# Security Workflow Test Documentation

This file documents the test scenarios for the security workflow validation.

## Test Timestamp
- Created: 2025-06-23 11:51:37
- Branch: test/git-flow-validation-20250623-115137

## Test Files Created
1. `test-security-scan.js` - JavaScript file with test security patterns
2. `Dockerfile.test` - Docker file for container scanning
3. `test-security-validation.md` - This documentation file

## Expected Workflow Behavior
According to git-flow-diagram.md, the security workflow should:
- Trigger on PR to develop branch
- Run all security scans (Trivy, TruffleHog, Docker scan)
- Upload results to GitHub Security tab