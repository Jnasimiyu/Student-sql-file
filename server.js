const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Create MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '123456788', 
  database: 'student_portal',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

app.get('/api/test-db', async (req, res) => {
    try {
      const [result] = await pool.execute('SELECT 1 + 1 AS result');
      res.json({ message: 'Database Connected!', result: result[0] });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => {
    console.log(`✅ Server running on port ${PORT}`);
  });
