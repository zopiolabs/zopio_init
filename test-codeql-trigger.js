// Test file to trigger CodeQL analysis
// This file contains various JavaScript patterns for security testing

function testSecurityPatterns() {
  // Potential SQL injection pattern (for CodeQL to detect)
  const userInput = process.argv[2];
  const query = "SELECT * FROM users WHERE id = " + userInput; // Unsafe concatenation
  
  // Potential XSS pattern
  const htmlContent = "<div>" + userInput + "</div>"; // Unsafe HTML generation
  
  // Hardcoded credentials (should be detected)
  const apiKey = "sk-1234567890abcdef"; // Hardcoded secret
  
  // Path traversal vulnerability
  const filePath = "./uploads/" + userInput; // Unsafe path concatenation
  
  console.log("Test patterns created for CodeQL analysis");
}

// Export for testing
module.exports = { testSecurityPatterns };