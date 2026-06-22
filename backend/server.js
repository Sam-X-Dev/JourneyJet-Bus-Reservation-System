// ==============================================
// Bus Reservation System
// server.js
// ==============================================

const http = require("http");
const url = require("url");
const db = require("./db");

const PORT = 3000;


// ==============================================
// Configuration
// ==============================================

const validTables = [
    "passengers",
    "buses",
    "conductors",
    "tickets"
];

const primaryKeys = {
    passengers: "p_id",
    buses: "b_id",
    conductors: "c_id",
    tickets: "t_id"
};


// ==============================================
// Helper : Send JSON Response
// ==============================================

function sendJSON(res, statusCode, data) {

    res.writeHead(statusCode, {

        "Content-Type": "application/json",

        "Access-Control-Allow-Origin": "*",

        "Access-Control-Allow-Methods":
            "GET, POST, PUT, DELETE, OPTIONS",

        "Access-Control-Allow-Headers":
            "Content-Type"

    });

    res.end(JSON.stringify(data));

}


// ==============================================
// Helper : Read Request Body
// ==============================================

function getBody(req) {

    return new Promise((resolve, reject) => {

        let body = "";

        req.on("data", chunk => {

            body += chunk.toString();

        });

        req.on("end", () => {

            if (body === "") {

                resolve({});

                return;

            }

            try {

                resolve(JSON.parse(body));

            }

            catch {

                reject("Invalid JSON");

            }

        });

    });

}


// ==============================================
// Helper : Validate Table
// ==============================================

function isValidTable(table) {

    return validTables.includes(table);

}


// ==============================================
// Helper : Get Primary Key
// ==============================================

function getPrimaryKey(table) {

    return primaryKeys[table];

}


// ==============================================
// Helper : Execute Query
// ==============================================

function executeQuery(sql, values = []) {

    return new Promise((resolve, reject) => {

        db.query(sql, values, (err, result) => {

            if (err) {

                reject(err);

                return;

            }

            resolve(result);

        });

    });

}

// ==============================================
// Create HTTP Server
// ==============================================

const server = http.createServer(async (req, res) => {

    // ==========================================
    // CORS
    // ==========================================

    if (req.method === "OPTIONS") {

        sendJSON(res, 200, {});

        return;

    }

    const parsedUrl = url.parse(req.url, true);

    const pathname = parsedUrl.pathname;

    const table = pathname.replace("/", "");



    // ==========================================
    // Home Route
    // ==========================================

    if (pathname === "/" && req.method === "GET") {

        sendJSON(res, 200, {

            success: true,

            message: "Bus Reservation System API Running"

        });

        return;

    }



    // ==========================================
    // Generic GET
    // ==========================================

    if (req.method === "GET" && isValidTable(table)) {

        try {

            const id = parsedUrl.query.id;

            let sql = "";

            let result = [];

            if (id) {

                sql = `
                    SELECT *
                    FROM ${table}
                    WHERE ${getPrimaryKey(table)} = ?
                `;

                result = await executeQuery(sql, [id]);

            }

            else {

                sql = `
                    SELECT *
                    FROM ${table}
                `;

                result = await executeQuery(sql);

            }

            sendJSON(res, 200, {

                success: true,

                count: result.length,

                data: result

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }



    // ==========================================
    // Generic POST
    // ==========================================

    if (req.method === "POST" && isValidTable(table)) {

        try {

            const body = await getBody(req);

            const columns = Object.keys(body);

            const values = Object.values(body);

            const placeholders = columns
                .map(() => "?")
                .join(",");

            const sql = `

                INSERT INTO ${table}

                (${columns.join(",")})

                VALUES

                (${placeholders})

            `;

            const result = await executeQuery(sql, values);

            sendJSON(res, 201, {

                success: true,

                message: "Record Added Successfully",

                insertId: result.insertId

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }

        // ==========================================
    // Generic PUT
    // ==========================================

    if (req.method === "PUT" && isValidTable(table)) {

        try {

            const id = parsedUrl.query.id;

            if (!id) {

                sendJSON(res, 400, {

                    success: false,

                    message: "ID is required"

                });

                return;

            }

            const body = await getBody(req);

            const columns = Object.keys(body);

            const values = Object.values(body);

            const updateColumns = columns
                .map(column => `${column} = ?`)
                .join(", ");

            values.push(id);

            const sql = `

                UPDATE ${table}

                SET ${updateColumns}

                WHERE ${getPrimaryKey(table)} = ?

            `;

            const result = await executeQuery(sql, values);

            sendJSON(res, 200, {

                success: true,

                message: "Record Updated Successfully",

                affectedRows: result.affectedRows

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }



    // ==========================================
    // Generic DELETE
    // ==========================================

    if (req.method === "DELETE" && isValidTable(table)) {

        try {

            const id = parsedUrl.query.id;

            if (!id) {

                sendJSON(res, 400, {

                    success: false,

                    message: "ID is required"

                });

                return;

            }

            const sql = `

                DELETE FROM ${table}

                WHERE ${getPrimaryKey(table)} = ?

            `;

            const result = await executeQuery(sql, [id]);

            sendJSON(res, 200, {

                success: true,

                message: "Record Deleted Successfully",

                affectedRows: result.affectedRows

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }
        // ==========================================
    // Reports API
    // ==========================================

    if (req.method === "GET" && pathname === "/reports/passenger-ticket") {

        try {

            const sql = "SELECT * FROM passenger_ticket_details";

            const result = await executeQuery(sql);

            sendJSON(res, 200, {

                success: true,

                count: result.length,

                data: result

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }



    if (req.method === "GET" && pathname === "/reports/passenger-bus") {

        try {

            const sql = "SELECT * FROM passenger_bus_details";

            const result = await executeQuery(sql);

            sendJSON(res, 200, {

                success: true,

                count: result.length,

                data: result

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }



    if (req.method === "GET" && pathname === "/reports/conductor-bus") {

        try {

            const sql = "SELECT * FROM conductor_bus_details";

            const result = await executeQuery(sql);

            sendJSON(res, 200, {

                success: true,

                count: result.length,

                data: result

            });

        }

        catch (error) {

            sendJSON(res, 500, {

                success: false,

                message: error.message

            });

        }

        return;

    }



    // ==========================================
    // Route Not Found
    // ==========================================

    sendJSON(res, 404, {

        success: false,

        message: "Route Not Found"

    });

});



// ==============================================
// Start Server
// ==============================================

server.listen(PORT, () => {

    console.log("======================================");

    console.log(" Bus Reservation System Server Running");

    console.log(" http://localhost:3000");

    console.log("======================================");

});