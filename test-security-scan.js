// Test file for Security Workflow validation
// This file is created to test GitHub Actions security scans

// Test 1: Potential SQL injection vulnerability (for Semgrep)
function getUserData(userId) {
  const query = `SELECT * FROM users WHERE id = ${userId}`;
  return db.query(query);
}

// Test 2: Hardcoded secret (for TruffleHog - using obviously fake secret)
const API_KEY = "fake_api_key_for_testing_only_not_real";

// Test 3: Potential XSS vulnerability (for Semgrep)
function displayUserInput(input) {
  document.innerHTML = input;
}

// Test 4: Insecure random (for security audit)
function generateToken() {
  return Math.random().toString(36);
}

// Test 5: Command injection (for SAST)
const exec = require('child_process').exec;
function runCommand(userInput) {
  exec(`ls ${userInput}`);
}

console.log("Security test file created");