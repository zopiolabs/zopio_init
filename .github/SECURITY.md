# Security Policy

## 🛡️ Reporting Security Vulnerabilities

The Zopio team takes security seriously. We appreciate your efforts to responsibly disclose your findings and will make every effort to acknowledge your contributions.

### Where to Report

**DO NOT** open a public issue for security vulnerabilities. Instead, please report them privately through one of these channels:

1. **GitHub Security Advisories** (Preferred):
   - Go to our [Security Advisories](https://github.com/zopiolabs/zopio_init/security/advisories)
   - Click "Report a vulnerability"
   - Fill out the form with details

2. **Email**:
   - Send details to: security@zopio.dev
   - Encrypt sensitive information using our [PGP key](https://keys.openpgp.org/search?q=security@zopio.dev)

### What to Include

Please provide as much information as possible:

- **Description**: Clear description of the vulnerability
- **Impact**: What can be achieved by exploiting this vulnerability
- **Steps to Reproduce**: Detailed steps to reproduce the issue
- **Affected Versions**: Which versions of Zopio are affected
- **Proof of Concept**: If possible, include code or screenshots
- **Suggested Fix**: If you have ideas on how to fix it

### What to Expect

1. **Acknowledgment**: We'll acknowledge receipt within 48 hours
2. **Communication**: We'll keep you informed of our progress
3. **Fix Timeline**: We aim to fix critical issues within 7 days
4. **Credit**: We'll credit you in our security acknowledgments (unless you prefer to remain anonymous)
5. **Bounty**: While we don't have a formal bounty program yet, we may offer rewards for significant findings

## 🔒 Security Measures

### Our Security Practices

- **Code Reviews**: All code requires review before merging
- **Automated Scanning**: We use CodeQL and other tools for vulnerability scanning
- **Dependency Management**: Regular updates via Dependabot
- **Secret Scanning**: Automated detection of exposed credentials
- **Security Headers**: Proper security headers in all applications
- **Input Validation**: Comprehensive input validation and sanitization
- **Authentication**: Secure authentication via Clerk
- **Rate Limiting**: Protection against abuse via Arcjet

### Supported Versions

We provide security updates for:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0.0 | :x:                |

## 🚨 Security Best Practices for Contributors

When contributing to Zopio:

1. **Never commit secrets**: API keys, passwords, tokens, etc.
2. **Validate inputs**: Always validate and sanitize user inputs
3. **Use parameterized queries**: Prevent SQL injection
4. **Implement proper authentication**: Use our auth system
5. **Handle errors gracefully**: Don't expose sensitive information
6. **Keep dependencies updated**: Regularly update packages
7. **Follow OWASP guidelines**: Implement security best practices

## 📋 Security Checklist for PRs

Before submitting a PR, ensure:

- [ ] No hardcoded secrets or credentials
- [ ] All user inputs are validated
- [ ] Authentication is properly implemented
- [ ] Authorization checks are in place
- [ ] Error messages don't leak sensitive info
- [ ] Dependencies are up to date
- [ ] Security headers are configured
- [ ] Rate limiting is implemented where needed

## 🔐 Disclosure Policy

- We request 90 days to fix issues before public disclosure
- We'll work with you to understand and resolve the issue
- We'll publicly acknowledge your contribution (with permission)
- We support responsible disclosure and will not pursue legal action

## 📚 Security Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Node.js Security Best Practices](https://nodejs.org/en/docs/guides/security/)
- [Next.js Security](https://nextjs.org/docs/authentication)
- [Prisma Security](https://www.prisma.io/docs/concepts/components/prisma-client/security)

## 🙏 Acknowledgments

We thank the following security researchers for their contributions:

<!-- Security researchers will be added here -->

---

**Thank you for helping keep Zopio and its users safe!** 🛡️
