require('dotenv').config();
const mysql = require('mysql2');
const express = require('express');
const app = express();
app.use(express.json())

// create the connection to database
const connection = mysql.createConnection({
  host: process.env.DB_HOST, // address of the server
  user: process.env.DB_USER, // username
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});



app.get("/bars", (req, res) => {
  connection.query("SELECT * from bars", (err, results) => {
      if (err) {
        res.status(500).json({"error" : "Error retrieving data"});
      } else {
        res.status(200).json(results);
      }
    });
});





app.post("/bars/", (req, res) => {
  const { name, city, secret_code, code_postal, address, longitude, latitude, is_beer, is_vodka, is_whisky } = req.body;
  const created_at = "2021-02-03 11:45:46";
  const updated_at = created_at;
  
  connection.query(
  "INSERT INTO bars( name, city, secret_code, code_postal, address, longitude, latitude, is_beer, is_vodka, is_whisky,created_at,updated_at) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
  [name, city, secret_code, code_postal, address, longitude, latitude, is_beer, is_vodka, is_whisky,created_at,updated_at], 
  (err, results) => {
        if (err) {
          console.log(err);
         res.status(500).json({"error" : "Error saving bars"});
        } else {
          res.status(200).json({"msg" : "Successfully saved", "id":results.insertId});
        }
      }
  );
});


app.get("/bars/:id", (req, res) => {
  connection.query(
  "SELECT * FROM bars WHERE id=? LIMIT 1",
  [req.params.id], 
  (err, results) => {
        if (err) {
          console.log(err);
          res.status(500).json({"error" : "Error saving bars"});
        } else {
          res.status(200).json(results.pop());
        }
      }
  ); 
});



app.put("/bars/:id", (req, res) => {
  const { name, city, secret_code, code_postal, address, longitude, latitude, is_beer, is_vodka, is_whisky } = req.body;
  const updated_at = "2021-01-03 11:45:46";
  connection.query(
    "UPDATE bars SET name=?, city=?, secret_code=?, code_postal=?, address=?, longitude=?, latitude=?, is_beer=?, is_vodka=?, is_whisky=?,updated_at=? WHERE id=?",
      [name, city, secret_code, code_postal, address, longitude, latitude, is_beer, is_vodka, is_whisky,updated_at,req.params.id], 
  (err, results) => {
        if (err) {
          console.log(err);
         res.status(500).json({"error" : "Error update bars"});
        } else {
          res.status(200).json({"msg" : "Successfully updated"});
        }
      }
  );
});


app.delete("/bars/:id", (req, res) => {
  connection.query(
  "DELETE FROM bars WHERE id = ?",
  [req.params.id], 
  (err, results) => {
        if (err) {
          console.log(err);
          res.status(500).json({"error" : "Error delete bars"});
        } else {
          res.status(200).json({"msg" : "Successfully deleted"});
        }
      }
  ); 
});


app.get("/", (req, res) => {
  res.send("Welcome to My API v1 bro!");
});


// Launch server
app.listen(process.env.PORT, () => {
  console.log(`Server is running on ${process.env.PORT}`);
});