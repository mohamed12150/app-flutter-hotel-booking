// models/Booking.js
const mongoose = require("mongoose");

const bookingSchema = new mongoose.Schema({
  userId: String,
  hotelId: String,
  flightId: String,
  date: Date,
  status: { type: String, default: "pending" }
});

module.exports = mongoose.model("Booking", bookingSchema);
