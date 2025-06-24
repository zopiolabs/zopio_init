// This file contains intentional SQL injection vulnerabilities for testing CodeQL
const express = require('express');
const mysql = require('mysql');

const app = express();

// FIXED: Using parameterized queries to prevent SQL injection
app.get('/user', (req, res) => {
  const userId = req.query.id;
  // Safe from SQL injection - using parameterized query
  const query = "SELECT * FROM users WHERE id = ?";
  
  connection.query(query, [userId], (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// FIXED: Using parameterized queries
app.post('/login', (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  
  // Safe from SQL injection
  const query = 'SELECT * FROM users WHERE username = ? AND password = ?';
  
  connection.query(query, [username, password], (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// FIXED: Using spawn with arguments array
app.get('/ping', (req, res) => {
  const host = req.query.host;
  // Safe from command injection
  const { spawn } = require('child_process');
  const ping = spawn('ping', ['-c', '4', host]);
  
  let output = '';
  ping.stdout.on('data', (data) => {
    output += data;
  });
  
  ping.on('close', (code) => {
    if (code !== 0) {
      res.status(500).send('Ping failed');
      return;
    }
    res.send(output);
  });
});

// FIXED: Path validation and sanitization
app.get('/file', (req, res) => {
  const filename = req.query.name;
  // Safe from path traversal
  const path = require('path');
  const safePath = path.join('/var/data', path.basename(filename));
  
  // Additional validation
  if (!safePath.startsWith('/var/data/')) {
    res.status(400).send('Invalid file path');
    return;
  }
  
  res.sendFile(safePath);
});