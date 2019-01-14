const mongoose = require('mongoose');
const express = require('express');
const bodyParser = require('body-parser');

const User = require('./models/User');

const {
  PORT = 5000,
  DB_HOST,
  DB_PORT,
  DB_SCHEMA = 'admin',
  DB_USERNAME,
  DB_PASSWORD
} = process.env;

const CONNECTION_STRING = `mongodb://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_SCHEMA}`;
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

mongoose.connect(CONNECTION_STRING);
mongoose.Promise = global.Promise;

const db = mongoose.connection;

//Bind connection to error event (to get notification of connection errors)
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

app.use('/users', async (req, res) => {
  const users = await User.find({});
  res.send(users);
});

db.on('connected', () => {
  console.log('Connected to Database');
  app.listen(PORT, () => {
    console.log(`server listening on port: ${PORT}`);
  });
})