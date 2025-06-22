// Test file that should NOT trigger CodeQL on feature branches
console.log("This is a test for non-protected branches");

// Another potential security issue (but should not be scanned on feature branch)
const dangerousFunction = (userInput) => {
  return eval(userInput); // Dangerous eval usage
};