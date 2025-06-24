# Security Test Scenarios

This directory contains intentionally vulnerable code for testing the GitHub Security workflow.

## ⚠️ WARNING
These files contain security vulnerabilities for testing purposes only. Do NOT use in production.

## Test Files

### 1. vulnerable-package.json
- **Purpose**: Test Trivy dependency scanning
- **Vulnerabilities**:
  - lodash 4.17.20 - Prototype pollution
  - minimist 0.0.8 - Prototype pollution
  - serialize-javascript 1.9.0 - Code injection
  - yargs-parser 5.0.0 - Prototype pollution
  - axios 0.18.0 - Server-side request forgery
  - eslint 4.18.2 - Regular expression DoS
  - webpack 3.11.0 - Various vulnerabilities

### 2. test-secrets.js
- **Purpose**: Test TruffleHog secret scanning
- **Test Patterns**:
  - AWS access keys (fake)
  - API keys (Stripe, GitHub)
  - Database connection strings with passwords
  - Private keys
  - JWT secrets

### 3. sql-injection.js
- **Purpose**: Test CodeQL SAST analysis
- **Vulnerabilities**:
  - SQL injection via string concatenation
  - SQL injection via template literals
  - Command injection
  - Path traversal

### 4. xss-vulnerability.js
- **Purpose**: Test CodeQL XSS detection
- **Vulnerabilities**:
  - Direct HTML injection
  - Unsafe innerHTML usage
  - Reflected XSS
  - DOM-based XSS

### 5. Dockerfile
- **Purpose**: Test container security scanning
- **Vulnerabilities**:
  - Old Node.js base image (10.16.0)
  - Running as root user
  - Installing vulnerable OS packages

## Expected Security Findings

### Trivy (Dependency Scan)
- Should detect all vulnerable npm packages
- Should report CRITICAL and HIGH severity issues
- Should ignore unfixed vulnerabilities

### TruffleHog (Secret Scan)
- Should detect credential patterns
- May detect as "unverified" since they're fake
- Should flag database connection strings

### CodeQL (SAST)
- Should detect SQL injection vulnerabilities
- Should detect XSS vulnerabilities
- Should detect command injection
- Should detect path traversal

### Container Scan
- Should detect vulnerabilities in base image
- Should flag running as root
- Should identify vulnerable OS packages