const express = require("express");
const cors = require('cors');
var mysql = require('./dbcon.js');
const bodyParser = require('body-parser');

const app = express();
const port = 4169;
const corsOptions = {
    origin: "https://dailei5.github.io/index.html",
    optionsSuccessStatus: 200
}

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.set('mysql', mysql);

// user sign up
app.post("/UserSignUp", (req, res) => {
    let mysql = req.app.get('mysql');
    let sql = "INSERT INTO UserSignUps (lastName, firstName, password, zipCode, email) VALUES (?, ?, ?, ?, ?)";
    let inserts = [req.body.lastName, req.body.firstName, req.body.password, req.body.zipCode, req.body.email];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        let msg = ""
        if (error) {
            let msg = "incorrect info"
        } else {
            let msg = ` ${req.body.firstName}, your email is ${req.body.email} and your account is ready to use.`;
        }
        res.send({ msg });
    });
});

//Select a user from the Users table.
app.get("/UserLogin", (req, res) => {
    let mysql = req.app.get('mysql');
    let sql = "SELECT userID, lastName, firstName, email FROM UserSignUps WHERE email = ? AND password = ?";
    let data = [req.query.email, req.query.password];
    sql = mysql.pool.query(sql, data, function (error, results, fields) {
        const queryResults = {};
        if (error || results[0] == null) {
            queryResults["successful"] = false;
        } else {
            queryResults["successful"] = true;
            queryResults["userID"] = results[0].userID;
            queryResults["firstName"] = results[0].firstName;
            queryResults["lastName"] = results[0].lastName;
            queryResults["email"] = results[0].email;
        };
        res.send(queryResults);
    });
});

// Select specific user:
app.post("/getUser", (req, res) => {
    var mysql = req.app.get('mysql');
    var sql = "SELECT PaymentMethods.paymentID, CreditCards.cardID, CreditCards.cardName, CreditCards.gas, CreditCards.grocery, CreditCards.travel, CreditCards.dining, CreditCards.otherReward, CreditCards.annualFee FROM CreditCards \
    INNER JOIN PaymentMethods ON PaymentMethods.cardID = CreditCards.cardID \
    WHERE PaymentMethods.userID = ?;";
    insert = [req.body.userID]
    sql = mysql.pool.query(sql, insert, function (error, results, fields) {
        var queryResults = [];
        results.forEach((row) => {
            queryResults.push(row)
        })
        console.log(queryResults);
        res.send(queryResults);
    });
});


// Select all Guides in certain location:
app.post("/getGuides", (req, res) => {
    var mysql = req.app.get('mysql');
    var sql = "SELECT PaymentMethods.paymentID, CreditCards.cardID, CreditCards.cardName, CreditCards.gas, CreditCards.grocery, CreditCards.travel, CreditCards.dining, CreditCards.otherReward, CreditCards.annualFee FROM CreditCards \
    INNER JOIN PaymentMethods ON PaymentMethods.cardID = CreditCards.cardID \
    WHERE PaymentMethods.userID = ?;";
    insert = [req.body.userID]
    sql = mysql.pool.query(sql, insert, function (error, results, fields) {
        var queryResults = [];
        results.forEach((row) => {
            queryResults.push(row)
        })
        console.log(queryResults);
        res.send(queryResults);
    });
});


// Create a new table
app.get('/createTable', (req, res) => {
    let sql = 'CREATE TABLE......';
    let query = pool.createQuery(sql, (err, result) => {
        if(err) throw err;
        console.log(sql);
        res.send('database created');
    })

})

// Insert data to a table
app.get('/addUser', (req, res) => {
    let post = {
        lastName: 'Octopus',
        firstName: 'Tulius',
        password: '1234',
        email: 'tp@tp.tp',
        zipCode: '432143'
    };
    let sql = 'INSERT INTO UserRegistrations SET ?';
    let query = pool.createQuery(sql, post, (err, result) => {
        if(err) throw err;
        console.log(sql);
        req.params
    });
});

app.listen(port, () => console.log(`Express is listening on the port ${port}`));