// ----------------------------------------------
// TCSS 445: Vehicle Vault
// Backend REST Service Module
// ----------------------------------------------
// Express is a Node.js web application framework
// that provides a wide range of APIs and methods
// Express API Reference:
// https://expressjs.com/en/resources/middleware/cors.html
// ----------------------------------------------
// retrieve necessary files (express and cors)
const express = require("express")
const cors = require("cors")
var session = require('express-session');
// retrieve the MySQL DB Configuration Module
const dbConnection = require("./config")
// use this library for parsing HTTP body requests
var bodyParser = require('body-parser');

// ----------------------------------------------
// (A) Create an express application instance
// and parses incoming requests with JSON
// payloads
// ----------------------------------------------
var app = express(express.json);

// ----------------------------------------------
// (B) Use the express cors middleware
// Cross-origin resource sharing (CORS)
// is a technique that restricts specified
// resources within web page to be accessed
// from other domains on which the origin
// resource was initiated the HTTP request
// Also use the bodyParser to parse in
// format the body of HTTP Requests
// ----------------------------------------------
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({ 
    secret: '123456cat',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 }
}))

// Import registration and login routes
const registerRouter = require('./routes/signup');
const loginRouter = require('./routes/login');

// Use the routes
app.use('/register', registerRouter);
app.use('/login', loginRouter);

// ----------------------------------------------
// Ref: https://expressjs.com/en/4x/api.html#app
// (C) Create a server such that it binds and
// listens on a specified host and port.
// We will use default host and port 3000.
app.listen(2000, () => {
    console.log("Express server is running and listening on port 2000");
});

// (1)Retrieve all car bodytypes from the database
app.get("/bodytypes", (request, response) => {
    const sqlQuery = "SELECT * FROM bodytype;";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
})

// (2)Retrieve all car brands from the database
app.get("/brands", (request, response) => {
    const sqlQuery = "SELECT * FROM brands;";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
})


// (3)Retrieve all car models from the database
app.get("/models", (request, response) => {
    const sqlQuery = "SELECT * FROM model;";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
})

// (4)Retrieve all car engine types from the database
app.get("/enginetypes", (request, response) => {
    const sqlQuery = "SELECT * FROM enginetype;";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
})


// (5)Retrieve one car bodytype from the database
app.get("/bodytypes/:bodytype", (request, response) => {
    const bodytype = request.params.bodytype;
    const sqlQuery = "SELECT * FROM bodytype WHERE bodytype = '" + bodytype + "';";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        if (result.length === 0) {
            return response.status(404).json({Error: "Car bodytype not found."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result[0]);
    });
})

// (6)Retrieve one car brand from the database
app.get("/brands/:brand", (request, response) => {
    const brand = request.params.brand;
    const sqlQuery = "SELECT * FROM brands WHERE brand = '" + brand + "';";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        if (result.length === 0) {
            return response.status(404).json({Error: "Car brand not found."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result[0]);
    });
})

// (7)Retrieve one car model from the database
app.get("/models/:model", (request, response) => {
    const model = request.params.model;
    const sqlQuery = "SELECT * FROM model WHERE model = ?;";
    dbConnection.query(sqlQuery, [model], (error, result) => {
        if (error) {
            return response.status(400).json({ Error: "Error in the SQL statement. Please check." });
        }
        if (result.length === 0) {
            return response.status(404).json({ Error: "Car model not found." });
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result[0]);
    });
})


// (8)Retrieve one car enginetype from the database
app.get("/enginetypes/:enginetype", (request, response) => {
    const enginetype = request.params.enginetype;
    const sqlQuery = "SELECT * FROM enginetype WHERE enginetype = '" + enginetype + "';";
    dbConnection.query(sqlQuery, (error, result) => {
        if (error) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."})
        }
        if (result.length === 0) {
            return response.status(404).json({Error: "Car engine type not found."})
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result[0]);
    });
})


// (9)Retrieve models for a specific brand from the database
app.get("/brands/:brand/models", (request, response) => {
    const brand = request.params.brand;
    const sqlQuery = "SELECT * FROM model WHERE brand = ?;";
    dbConnection.query(sqlQuery, [brand], (error, result) => {
        if (error){
            return response.status(400).json({Error: "Error in the SQL statement. Please check."});
        }
        if (result.length === 0) {
            return response.status(404).json({Error: "No models found for this brand."});
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
});

// (10)Retrieve models for a specific body type
app.get("/bodytypes/:bodytype/models", (request, response) => {
    const bodytype = request.params.bodytype;
    const sqlQuery = "SELECT * FROM model WHERE bodytype = ?;";
    dbConnection.query(sqlQuery, [bodytype], (error, result) => {
        if (error){
            return response.status(400).json({Error: "Error in the SQL statement. Please check."});
        }
        if (result.length === 0) {
            return response.status(404).json({Error: "No models found for this bodytype."});
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
});


// (11)Retrieve the models for a specific engine type
app.get("/enginetypes/:enginetype/models", (request, response) => {
    const enginetype = request.params.enginetype;
    const sqlQuery = "SELECT * FROM model WHERE enginetype = ?;";
    dbConnection.query(sqlQuery, [enginetype], (error, result) => {
        if (error){
            return response.status(400).json({Error: "Error in the SQL statement. Please check."});
        }
        if (result.length === 0) {
            return response.status(404).json({Error: "No models found for this enginetype."});
        }
        response.setHeader('SQLQuery', sqlQuery);
        return response.status(200).json(result);
    });
});


//(12) Fetch models in the current garage
app.get('/garage/current', (request, response) => {
    const sqlQuery = `
        SELECT model.*, current_garage.added_at
        FROM current_garage
        JOIN model ON current_garage.model = model.model
    `;
    dbConnection.query(sqlQuery, (error, results) => {
        if (error) {
            return response.status(500).json({ Error: "Failed to fetch current garage models." });
        }
        return response.status(200).json(results);
    });
});

// (13)Fetch models in the alltime garage
app.get('/garage/alltime', (request, response) => {
    const sqlQuery = `
        SELECT model.*, all_time_garage.added_at
        FROM all_time_garage
        JOIN model ON all_time_garage.model = model.model
    `;
    dbConnection.query(sqlQuery, (error, results) => {
        if (error) {
            return response.status(500).json({ Error: "Failed to fetch all time garage models." });
        }
        return response.status(200).json(results);
    });
});
// (14)Fetch models in the wishlist
app.get('/wishlist', (request, response) => {
    const sqlQuery = `
        SELECT model.*, wishlist.added_at
        FROM wishlist
        JOIN model ON wishlist.model = model.model
    `;
    dbConnection.query(sqlQuery, (error, results) => {
        if (error) {
            return response.status(500).json({ Error: "Failed to fetch wishlist models." });
        }
        return response.status(200).json(results);
    });
});

// (15)insert a new record by model name into the database
app.post("/models/:model", (request, response) => {
    const model = request.params.model;
    const checkQuery = 'SELECT * FROM model WHERE model = ?;';
    dbConnection.query(checkQuery, [model], (checkError, checkResult) => {
        if (checkError) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."});
        }
        if (checkResult.length > 0) {
            return response.status(409).json({Error: "Duplicate record. The model already exists."});
        }

        const sqlQuery = 'INSERT INTO model (brand, model, bodytype, enginename, enginetype, top_speed, bhp, torque, info) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);';
        const values = [request.body.brand, request.body.model, request.body.bodytype,
            request.body.enginename, request.body.enginetype, request.body.top_speed, request.body.bhp, request.body.torque, request.body.info];
        dbConnection.query(sqlQuery, values, (error, result) => {
            if(error){
                return response.status(400).json({Error: "Failed to add vehicle to the database."});
            }
            return response.status(200).json({Success: "Vehicle added successfully."});
        });
    });
})

// (16)insert a new record by brand name into the database
app.post("/brands/:brand", (request, response) => {
    const brand = request.params.brand;
    const checkQuery = 'SELECT * FROM brands WHERE brand = ?;';
    dbConnection.query(checkQuery, [brand], (checkError, checkResult) => {
        if (checkError) {
            return response.status(400).json({Error: "Error in the SQL statement. Please check."});
        }
        if (checkResult.length > 0) {
            return response.status(409).json({Error: "Duplicate record. The model already exists."});
        }

        const sqlQuery = 'INSERT INTO brands (brand) VALUES (?);';
        const values = [request.body.brand];
        dbConnection.query(sqlQuery, values, (error, result) => {
            if(error){
                return response.status(400).json({Error: "Failed to add brand to the database."});
            }
            return response.status(200).json({Success: "Brand added successfully."});
        });
    });
})

// (17)POST route to add a model to the current garage
app.post('/garage/current', (request, response) => {
    const model = request.body.model;
    const sqlQuery = 'INSERT INTO current_garage (model) VALUES (?)';
    dbConnection.query(sqlQuery, [model], (error, result) => {
        if (error) {
            return response.status(400).json({ Error: "Failed to add model to the current garage." });
        }
        return response.status(200).json({ Success: "Model added to the current garage." });
    });
});

// (18)POST route to add a model to the all-time garage
app.post('/garage/alltime', (request, response) => {
    const model = request.body.model;
    const sqlQuery = 'INSERT INTO all_time_garage (model) VALUES (?)';
    dbConnection.query(sqlQuery, [model], (error, result) => {
        if (error) {
            return response.status(400).json({ Error: "Failed to add model to the all-time garage." });
        }
        return response.status(200).json({ Success: "Model added to the all-time garage." });
    });
});

// (19)POST route to add user login information
app.post('/signup', (request, response) => {
    const {uemail, upassword, fullname} = request.body;
    const sqlQuery = 'INSERT INTO logininfo (uemail, upassword, fullname) VALUES (?,?,?)';
    dbConnection.query(sqlQuery, [uemail, upassword, fullname], (error, result) => {
        if (error) {
            return response.status(400).json({ Error: "Failed to add login info." });
        }
        return response.status(200).json({ Success: "Login successfully added!" });
    });
});

//(20)Add a model to the wishlist
app.post('/wishlist', (request, response) => {
    const model = request.body.model;
    const sqlQuery = 'INSERT INTO wishlist (model) VALUES (?)';
    dbConnection.query(sqlQuery, [model], (error, result) => {
        if (error) {
            return response.status(400).json({ Error: "Failed to add model to the wishlist." });
        }
        return response.status(200).json({ Success: "Model added to the wishlist." });
    });
});

//(21) PUT route to update a model in the database (by model name)
app.put("/models/:model", (request, response) => {
    const model = request.params.model;
    const sqlQuery = 'UPDATE model SET brand =?,bodytype =?, enginename =?, enginetype =?, top_speed =?, bhp =?, torque =?, info =? WHERE model =?;';
    const values = [request.body.brand, request.body.bodytype, request.body.enginename, request.body.enginetype,
        request.body.top_speed, request.body.bhp, request.body.torque, request.body.info, model];
    
    dbConnection.query(sqlQuery, values, (error, result) => {
        if (error) {
            return response.status(400).json({ Error: "Failed to update vehicle in the database." });
        }
        return response.status(200).json({ Success: "Vehicle updated successfully." });
    });
});

//(22)Delete model from all-time garage
app.delete('/garage/alltime/:model', (request, response) => {
    const model = request.params.model;
    const sqlQuery = 'DELETE FROM all_time_garage WHERE model = ?';
    dbConnection.query(sqlQuery, [model], (error, results) => {
        if (error) {
            return response.status(500).json({ Error: "Failed to delete model from the all-time garage." });
        }
        return response.status(200).json({ Success: "Model deleted successfully." });
    });
});

//(23)Delete model from current garage
app.delete('/garage/current/:model', (request, response) => {
    const model = request.params.model;
    const sqlQuery = 'DELETE FROM current_garage WHERE model = ?';
    dbConnection.query(sqlQuery, [model], (error, results) => {
        if (error) {
            return response.status(500).json({ Error: "Failed to delete model from the current garage." });
        }
        return response.status(200).json({ Success: "Model deleted successfully." });
    });
});

// (24)Delete a model from the wishlist
app.delete('/wishlist/:model', (request, response) => {
    const model = request.params.model;
    const sqlQuery = 'DELETE FROM wishlist WHERE model = ?';
    dbConnection.query(sqlQuery, [model], (error, results) => {
        if (error) {
            return response.status(500).json({ Error: "Failed to delete model from the wishlist." });
        }
        return response.status(200).json({ Success: "Model deleted successfully." });
    });
});
