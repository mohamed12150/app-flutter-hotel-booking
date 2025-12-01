# Hotel Booking Backend API

Backend API for Hotel Booking Mobile App built with Node.js, Express, and MongoDB.

## 🚀 Deploy to Render

### Prerequisites
1. Create account on [Render.com](https://render.com)
2. Create MongoDB database (MongoDB Atlas recommended)

### Deployment Steps

1. **Push code to GitHub** (Already done ✅)

2. **Create Web Service on Render:**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New +" → "Web Service"
   - Connect your GitHub repository: `mohamed12150/booking`
   - Configure:
     - **Name**: hotel-booking-api
     - **Root Directory**: backend
     - **Environment**: Node
     - **Build Command**: `npm install`
     - **Start Command**: `npm start`
     - **Plan**: Free

3. **Set Environment Variables:**
   Add these in Render Dashboard → Environment:
   ```
   MONGODB_URI=your_mongodb_connection_string
   JWT_SECRET=your_secret_key_here
   NODE_ENV=production
   ```

4. **Deploy!**
   - Click "Create Web Service"
   - Render will automatically deploy your API
   - You'll get a URL like: `https://hotel-booking-api.onrender.com`

## 📡 API Endpoints

### Hotels
- `GET /api/hotels` - Get all hotels
- `GET /api/hotels/:id` - Get hotel by ID
- `POST /api/hotels` - Create hotel
- `PUT /api/hotels/:id` - Update hotel
- `DELETE /api/hotels/:id` - Delete hotel

### Rooms
- `GET /api/rooms` - Get all rooms
- `GET /api/rooms/hotel/:hotelId` - Get rooms by hotel
- `GET /api/rooms/:id` - Get room by ID
- `POST /api/rooms` - Create room
- `PUT /api/rooms/:id` - Update room
- `DELETE /api/rooms/:id` - Delete room

### Bookings
- `GET /api/bookings` - Get all bookings
- `GET /api/bookings/user/:userId` - Get user bookings
- `GET /api/bookings/:id` - Get booking by ID
- `POST /api/bookings` - Create booking
- `PUT /api/bookings/:id` - Update booking
- `PATCH /api/bookings/:id/cancel` - Cancel booking

### Users
- `POST /api/users/register` - Register user
- `POST /api/users/login` - Login user
- `GET /api/users/:id` - Get user profile
- `PUT /api/users/:id` - Update user profile

## 🔧 Local Development

```bash
cd backend
npm install
npm start
```

## 📱 Connect to Flutter App

Update your Flutter app API endpoint to:
```dart
const String API_URL = 'https://your-app-name.onrender.com/api';
```
