// Test file for security scanning
// This file contains intentional patterns to test security scanners

// Test 1: Potential SQL injection (for CodeQL)
function getUserData(userId) {
  const query = `SELECT * FROM users WHERE id = ${userId}`;
  return db.query(query);
}

// Test 2: Hardcoded test secret (should be caught by TruffleHog)
// Note: This is a dummy secret for testing purposes only
const TEST_API_KEY = "test_sk_1234567890abcdef";

// Test 3: Potential XSS vulnerability
function displayUserInput(input) {
  document.innerHTML = input;
}

// Test 4: Insecure random number generation
function generateToken() {
  return Math.random().toString(36);
}

console.log("Security test file loaded");