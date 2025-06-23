// Test file for Semgrep SAST scanning
// Contains intentional security vulnerabilities for testing

const express = require('express');
const app = express();
const mysql = require('mysql');
const fs = require('fs');
const crypto = require('crypto');

// SQL Injection vulnerability
app.get('/user/:id', (req, res) => {
  const userId = req.params.id;
  // Direct string concatenation - SQL injection risk
  const query = `SELECT * FROM users WHERE id = ${userId}`;
  connection.query(query, (err, results) => {
    res.json(results);
  });
});

// XSS vulnerability
app.get('/search', (req, res) => {
  const searchTerm = req.query.q;
  // Direct HTML rendering without escaping
  res.send(`<h1>Search results for: ${searchTerm}</h1>`);
});

// Path traversal vulnerability
app.get('/file', (req, res) => {
  const filename = req.query.name;
  // No path validation
  const filepath = `/uploads/${filename}`;
  fs.readFile(filepath, (err, data) => {
    res.send(data);
  });
});

// Weak cryptography
function hashPassword(password) {
  // MD5 is cryptographically broken
  return crypto.createHash('md5').update(password).digest('hex');
}

// Command injection
app.post('/ping', (req, res) => {
  const host = req.body.host;
  // Direct command execution
  exec(`ping -c 4 ${host}`, (err, stdout) => {
    res.send(stdout);
  });
});

// Insecure random number generation
function generateToken() {
  // Math.random() is not cryptographically secure
  return Math.random().toString(36).substring(7);
}

// Missing authentication
app.delete('/admin/user/:id', (req, res) => {
  // No authentication check
  const userId = req.params.id;
  deleteUser(userId);
  res.send('User deleted');
});

// Hardcoded credentials
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: 'admin123', // Hardcoded password
  database: 'production'
};

// Insecure deserialization
app.post('/data', (req, res) => {
  // eval() on user input
  const data = eval('(' + req.body.data + ')');
  processData(data);
  res.send('Processed');
});

module.exports = app;