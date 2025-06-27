#!/usr/bin/env node

/**
 * Simple secret detection script for pre-commit hooks
 * Detects common patterns of secrets in staged files
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

// Patterns that likely indicate secrets
const SECRET_PATTERNS = [
  // API Keys
  /api[_\-\s]*key[_\-\s]*[:=]\s*['"][a-zA-Z0-9_\-]{20,}['"]/gi,
  /apikey\s*[:=]\s*['"][a-zA-Z0-9_\-]{20,}['"]/gi,
  
  // AWS
  /AKIA[0-9A-Z]{16}/g, // AWS Access Key ID
  /aws[_\-\s]*secret[_\-\s]*access[_\-\s]*key[_\-\s]*[:=]\s*['"][a-zA-Z0-9/+=]{40}['"]/gi,
  
  // Private Keys
  /-----BEGIN\s+(RSA|DSA|EC|OPENSSH|PGP)\s+PRIVATE\s+KEY-----/g,
  
  // GitHub
  /ghp_[a-zA-Z0-9]{36}/g, // GitHub Personal Access Token
  /gho_[a-zA-Z0-9]{36}/g, // GitHub OAuth Access Token
  /ghu_[a-zA-Z0-9]{36}/g, // GitHub User-to-server Access Token
  /ghs_[a-zA-Z0-9]{36}/g, // GitHub Server-to-server Access Token
  /ghr_[a-zA-Z0-9]{36}/g, // GitHub Refresh Token
  
  // Generic Secrets
  /password[_\-\s]*[:=]\s*['"][^'"]{8,}['"]/gi,
  /secret[_\-\s]*[:=]\s*['"][a-zA-Z0-9_\-]{16,}['"]/gi,
  /token[_\-\s]*[:=]\s*['"][a-zA-Z0-9_\-]{16,}['"]/gi,
  
  // Database URLs with passwords
  /[a-z]+:\/\/[^:]+:[^@]+@[^/]+/gi, // protocol://user:pass@host
];

// File extensions to check
const CHECK_EXTENSIONS = [
  '.js', '.jsx', '.ts', '.tsx', '.json', '.env', '.yml', '.yaml', 
  '.sh', '.bash', '.zsh', '.fish', '.config', '.conf', '.ini'
];

// Files/patterns to ignore
const IGNORE_PATTERNS = [
  /node_modules/,
  /\.git/,
  /\.env\.example$/,
  /\.env\.sample$/,
  /\.env\.template$/,
  /test\/fixtures/,
  /mock/,
  /detect-secrets\.js$/ // Ignore this file
];

function getChangedFiles() {
  try {
    // Get list of staged files
    const output = execSync('git diff --cached --name-only --diff-filter=ACM', { encoding: 'utf8' });
    return output.trim().split('\n').filter(file => file.length > 0);
  } catch (error) {
    console.error('Error getting staged files:', error.message);
    return [];
  }
}

function shouldCheckFile(filePath) {
  // Check if file should be ignored
  if (IGNORE_PATTERNS.some(pattern => pattern.test(filePath))) {
    return false;
  }
  
  // Check if file extension is in the list to check
  const ext = path.extname(filePath).toLowerCase();
  return CHECK_EXTENSIONS.includes(ext) || filePath.includes('.env');
}

function checkFileForSecrets(filePath) {
  try {
    // Get the staged content (not the working directory content)
    const content = execSync(`git show :${filePath}`, { encoding: 'utf8', maxBuffer: 10 * 1024 * 1024 });
    const issues = [];
    
    SECRET_PATTERNS.forEach(pattern => {
      const matches = content.match(pattern);
      if (matches) {
        matches.forEach(match => {
          // Find line number
          const lines = content.split('\n');
          const lineNumber = lines.findIndex(line => line.includes(match)) + 1;
          
          // Mask the secret for display
          const masked = match.replace(/(['"])[^'"]+(['"])/, '$1***REDACTED***$2');
          
          issues.push({
            file: filePath,
            line: lineNumber,
            match: masked,
            pattern: pattern.source
          });
        });
      }
    });
    
    return issues;
  } catch (error) {
    // File might be binary or too large
    return [];
  }
}

function main() {
  console.log('🔍 Checking for secrets in staged files...');
  
  const files = getChangedFiles();
  const filesToCheck = files.filter(shouldCheckFile);
  
  if (filesToCheck.length === 0) {
    console.log('✅ No files to check for secrets');
    return 0;
  }
  
  console.log(`Checking ${filesToCheck.length} files...`);
  
  let totalIssues = [];
  
  filesToCheck.forEach(file => {
    const issues = checkFileForSecrets(file);
    totalIssues = totalIssues.concat(issues);
  });
  
  if (totalIssues.length > 0) {
    console.error('\n❌ Potential secrets detected!\n');
    
    totalIssues.forEach(issue => {
      console.error(`  File: ${issue.file}${issue.line > 0 ? `:${issue.line}` : ''}`);
      console.error(`  Found: ${issue.match}`);
      console.error('');
    });
    
    console.error('Please remove these secrets before committing.');
    console.error('If these are false positives, you can:');
    console.error('  1. Move them to environment variables');
    console.error('  2. Use .env.example with placeholder values');
    console.error('  3. Add the file to .gitignore if appropriate');
    console.error('');
    
    return 1;
  }
  
  console.log('✅ No secrets detected');
  return 0;
}

// Run the script
const exitCode = main();
process.exit(exitCode);