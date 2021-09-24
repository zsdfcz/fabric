const express = require('express');
const app = express();
let path = require('path');
let sdk = require('./sdk');

const PORT = 8001;
const HOST = '0.0.0.0';
app.use(express.json());
app.use(express.urlencoded({ extended: true }))

app.post('/init', function (req, res) {
   let a = req.body.a;
   let aval = req.body.aval;
   let b = req.body.b;
   let bval = req.body.bval;
   let args = [a, aval, b, bval];
   sdk.send(false, 'Init', args, res);
});

app.post('/query', function (req, res) {
   let a = req.body.a;
   let args = [a];
   sdk.send(true, 'Query', args, res);
});

app.use(express.static(path.join(__dirname, '../client')));
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
