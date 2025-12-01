const mongoose = require("mongoose");

const hotelSchema = new mongoose.Schema({
  name: String,
  city: String,
  price: Number,
  availableRooms: Number,
  rating: Number
});

module.exports = mongoose.model("Hotel", hotelSchema);
