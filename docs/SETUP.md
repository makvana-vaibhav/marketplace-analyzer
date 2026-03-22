# Development Setup Guide

## Prerequisites
- Node.js 16+ ([Download](https://nodejs.org))
- PostgreSQL 12+ ([Download](https://www.postgresql.org/download/))
- Git
- Text Editor/IDE (VS Code recommended)

## Initial Setup (One Time)

### 1. Clone Repository
```bash
git clone <repository-url>
cd "Marketplace analyzer"
```

### 2. Install Backend Dependencies
```bash
cd backend
npm install
cd ..
```

### 3. Database Setup
Refer to [DATABASE_SETUP.md](./DATABASE_SETUP.md) for detailed instructions.

### 4. Configure Environment
```bash
# Copy example env files
cp .env.example .env
cp backend/.env.example backend/.env

# Edit with your settings
# nano backend/.env
```

### 5. Start Development Server

**Terminal 1 - Backend**
```bash
cd backend
npm run dev
```

Output should show:
```
Server is running on port 5000
Environment: development
```

**Terminal 2 - Test API**
```bash
curl http://localhost:5000/api/health
```

Expected response:
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

## Project Structure Reference

```
backend/
├── src/
│   ├── index.js              # Main server file
│   ├── config/
│   │   ├── index.js          # Config loader
│   │   └── database.js       # DB connection
│   ├── routes/               # API endpoints
│   ├── controllers/          # Request handlers
│   ├── models/               # DB queries
│   ├── services/             # Business logic
│   ├── middleware/           # Custom middleware
│   └── utils/
│       └── logger.js         # Logging utility
├── package.json
├── .env.example
└── .env                      # Your env vars (git ignored)
```

## Common Commands

### Development
```bash
# Start server with auto-reload
npm run dev

# Run tests
npm test

# Lint code
npm run lint
```

### Database
```bash
# Create migration
npm run migrate

# Seed data
npm run seed
```

## Coding Standards

### File Naming
- Controllers: `userController.js`
- Routes: `authRoutes.js`
- Services: `authService.js`
- Models: `User.js`

### Code Style
- Use ES6+ syntax
- Async/await for async operations
- Error handling with try-catch
- JSDoc comments for functions

### Example Service Function
```javascript
// services/authService.js
const bcrypt = require('bcryptjs');

async function hashPassword(password) {
  const salt = await bcrypt.genSalt(10);
  return await bcrypt.hash(password, salt);
}

async function verifyPassword(password, hash) {
  return await bcrypt.compare(password, hash);
}

module.exports = {
  hashPassword,
  verifyPassword,
};
```

## Environment Variables Reference

```env
# Server
PORT=5000
NODE_ENV=development

# Database (PostgreSQL)
DB_HOST=localhost
DB_PORT=5432
DB_NAME=marketplace_analyzer
DB_USER=postgres
DB_PASSWORD=postgres

# JWT
JWT_SECRET=your-secret-key
JWT_EXPIRE=7d

# API
API_BASE_URL=http://localhost:5000
FRONTEND_URL=http://localhost:3000

# Marketplace (Add as needed)
FLIPKART_API_KEY=xxx
FLIPKART_API_SECRET=xxx

# Logging
LOG_LEVEL=debug

# File Upload
MAX_FILE_SIZE=5242880
UPLOAD_DIR=./uploads
```

## Debugging

### Enable Debug Logs
```bash
DEBUG=* npm run dev
```

### Check Database Connection
```bash
psql -U postgres -d marketplace_analyzer -c "SELECT 1"
```

### View Logs
```bash
# Error logs
tail -f logs/error.log

# All logs
tail -f logs/debug.log
```

## Git Workflow

### Before First Commit
```bash
git config user.email "you@example.com"
git config user.name "Your Name"
```

### Create Feature Branch
```bash
git checkout -b feature/your-feature-name
git add .
git commit -m "feat: description of changes"
git push origin feature/your-feature-name
```

## Troubleshooting

### Port Already in Use
```bash
# Kill process on port 5000
kill -9 $(lsof -ti:5000)
```

### Database Connection Error
1. Check PostgreSQL is running: `sudo systemctl status postgresql`
2. Verify .env credentials
3. Ensure database exists: `psql -l`

### npm Install Fails
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and retry
rm -rf node_modules package-lock.json
npm install
```

## Next Steps

1. ✅ Setup complete
2. Start implementing routes
3. Create controllers
4. Add database models
5. Implement services

For API documentation, see API_GUIDE.md

---
**Last Updated:** March 22, 2026
