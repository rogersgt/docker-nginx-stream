const { Schema, model } = require('mongoose');

const userSchema = new Schema({
  name: String,
  age: Number
});

const User = model('User', userSchema, 'User');

module.exports = User;
