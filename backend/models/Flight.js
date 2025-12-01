// models/Flight.js
const mongoose = require("mongoose");

const flightSchema = new mongoose.Schema({
  airline: String,
  from: String,
  to: String,
  price: Number,
  seatsAvailable: Number,
  departureTime: Date,
  arrivalTime: Date
});

module.exports = mongoose.model("Flight", flightSchema);
