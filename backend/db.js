require("dotenv").config();

const mysql = require("mysql2");

// =========================
// DEBUG ENV VARIABLES
// =========================

console.log("================================");
console.log("DB_HOST :", process.env.DB_HOST);
console.log("DB_PORT :", process.env.DB_PORT);
console.log("DB_NAME :", process.env.DB_NAME);
console.log("DB_USER :", process.env.DB_USER);
console.log("================================");

// =========================
// MySQL Connection
// =========================

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT
});

connection.connect((err) => {

    if (err) {
        console.error("Database Connection Error:");
        console.error(err);
        return;
    }

    console.log("================================");
    console.log(" Connected Successfully");
    console.log("================================");

});

module.exports = connection;