const express = require('express');
const router = express.Router();
const Flight = require('../models/Flight');

// Get all flights
router.get('/', async (req, res) => {
  try {
    const flights = await Flight.find();
    res.json(flights);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get flight by ID
router.get('/:id', async (req, res) => {
  try {
    const flight = await Flight.findById(req.params.id);
    if (!flight) return res.status(404).json({ error: 'Flight not found' });
    res.json(flight);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Search flights
router.get('/search', async (req, res) => {
  try {
    const { from, to, date } = req.query;
    const query = {};
    if (from) query.from = from;
    if (to) query.to = to;
    
    const flights = await Flight.find(query);
    res.json(flights);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create new flight
router.post('/', async (req, res) => {
  try {
    const flight = new Flight(req.body);
    await flight.save();
    res.status(201).json(flight);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Update flight
router.put('/:id', async (req, res) => {
  try {
    const flight = await Flight.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!flight) return res.status(404).json({ error: 'Flight not found' });
    res.json(flight);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Delete flight
router.delete('/:id', async (req, res) => {
  try {
    const flight = await Flight.findByIdAndDelete(req.params.id);
    if (!flight) return res.status(404).json({ error: 'Flight not found' });
    res.json({ message: 'Flight deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
