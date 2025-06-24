// This file contains intentional SQL injection vulnerabilities for testing CodeQL
const express = require('express');
const mysql = require('mysql');

const app = express();

// BAD: Direct SQL concatenation - SQL Injection vulnerability
app.get('/user', (req, res) => {
  const userId = req.query.id;
  // Vulnerable to SQL injection
  const query = "SELECT * FROM users WHERE id = '" + userId + "'";
  
  connection.query(query, (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// BAD: String interpolation - SQL Injection vulnerability
app.post('/login', (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  
  // Vulnerable to SQL injection
  const query = `SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`;
  
  connection.query(query, (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// BAD: Command injection vulnerability
app.get('/ping', (req, res) => {
  const host = req.query.host;
  // Vulnerable to command injection
  const { exec } = require('child_process');
  exec('ping -c 4 ' + host, (error, stdout, stderr) => {
    if (error) {
      res.status(500).send(error.message);
      return;
    }
    res.send(stdout);
  });
});

// BAD: Path traversal vulnerability
app.get('/file', (req, res) => {
  const filename = req.query.name;
  // Vulnerable to path traversal
  const path = '/var/data/' + filename;
  res.sendFile(path);
});