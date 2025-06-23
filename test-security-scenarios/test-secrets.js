// Test file for TruffleHog secret scanning
// WARNING: These are FAKE secrets for testing purposes only

// Fake AWS credentials
const AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE";
const AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY";

// Fake API keys (modified to not trigger push protection)
const GITHUB_TOKEN = "ghp_FAKE1234567890abcdefghijklmnopqrstuv";
const STRIPE_API_KEY = "sk_test_FAKE4eC39HqLyjWDarjtT1zdp7dc";

// Fake database connection string
const DATABASE_URL = "postgresql://user:password123@localhost:5432/testdb";

// Fake JWT secret
const JWT_SECRET = "super-secret-jwt-key-do-not-use-in-production";

// Fake private key (truncated for test)
const PRIVATE_KEY = `-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA1234567890FAKEKEYFORTESTING
-----END RSA PRIVATE KEY-----`;

module.exports = {
  // These would trigger secret scanning (modified to not trigger push protection)
  apiKey: "sk_live_FAKE1234567890abcdefghijklmn",
  dbPassword: "MySecretPassword123!",
  webhookSecret: "whsec_FAKE1234567890abcdefghijklmnop"
};