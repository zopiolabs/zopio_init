// This file contains test secrets for security scanning validation
// WARNING: These are FAKE keys for testing purposes only

const config = {
  // Fake AWS credentials pattern (clearly marked as test)
  awsAccessKeyId: 'AKIAFAKEFAKEFAKETEST',
  awsSecretAccessKey: 'FAKEFAKEFAKEFAKEFAKEFAKEFAKEFAKETEST',
  
  // Fake API keys (modified to avoid push protection)
  stripeApiKey: 'sk_test_FAKEFAKEFAKEFAKEFAKEFAKEFAKE',
  githubToken: 'ghp_FAKEFAKEFAKEFAKEFAKEFAKEFAKEFAKE',
  
  // Database connection string with password
  databaseUrl: 'postgresql://admin:SuperSecret123!@localhost:5432/testdb',
  
  // Private key pattern
  privateKey: `-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA1234567890FAKEKEYFORTESTING
-----END RSA PRIVATE KEY-----`,

  // JWT secret
  jwtSecret: 'my-super-secret-jwt-key-for-testing-only'
};

module.exports = config;