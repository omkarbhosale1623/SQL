# Quick Setup Guide

## Prerequisites
- Node.js (v16+)
- MySQL (v8.0+)
- npm or yarn

## Step-by-Step Setup

### 1. Database Setup
```bash
# Connect to MySQL
mysql -u root -p

# Create and setup database
source db/schema.sql
source db/stored_procedures.sql
source db/seed.sql
```

### 2. Backend Setup
```bash
cd backend

# Install dependencies
npm install

# Copy and configure environment
cp config.env.example config.env
# Edit config.env with your MySQL credentials

# Start backend server
npm run dev
```

### 3. Frontend Setup
```bash
cd frontend

# Install dependencies
npm install

# Start frontend
npm start
```

## Default Test Accounts

After running the seed data, you'll have these test accounts:

### Admin User
- Username: `admin`
- Password: `admin123`
- Role: Admin (full access)

### Regular User
- Username: `user`
- Password: `user123`
- Role: User (basic access)

### Moderator
- Username: `moderator`
- Password: `mod123`
- Role: Moderator (limited admin access)

## Quick Test

1. Open http://localhost:3000
2. Login with admin credentials
3. Explore the dashboard features
4. Test user management and logs

## Troubleshooting

### Database Issues
```bash
# Check MySQL status
sudo systemctl status mysql

# Reset database
mysql -u root -p
DROP DATABASE IF EXISTS auth_system;
source db/schema.sql
source db/stored_procedures.sql
source db/seed.sql
```

### Backend Issues
```bash
# Check if port 5000 is available
netstat -tulpn | grep :5000

# Kill process if needed
kill -9 <PID>
```

### Frontend Issues
```bash
# Clear npm cache
npm cache clean --force

# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
```

## API Testing

Test the backend directly:
```bash
# Health check
curl http://localhost:5000/health

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
``` 