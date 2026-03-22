# 🚀 Quick Reference Guide

## File Locations

### Core Server Files
| File | Location | Purpose |
|------|----------|---------|
| Server Entry | `backend/src/index.js` | Main server file |
| Config | `backend/src/config/index.js` | Configuration loader |
| DB Connection | `backend/src/config/database.js` | PostgreSQL pool |
| Logger | `backend/src/utils/logger.js` | Logging utility |

### Configuration Files
| File | Location | Purpose |
|------|----------|---------|
| Root Env Template | `.env.example` | Environment template |
| Backend Env | `backend/.env.example` | Backend specific template |
| Git Ignore | `.gitignore` | Git ignore rules |

### Database Files
| File | Location | Purpose |
|------|----------|---------|
| Schema | `database/schema.sql` | Complete database schema |
| Init Script | `database/init.sql` | Database initialization |
| Knex Config | `database/knexfile.js` | Migration configuration |

### Documentation
| File | Location | Purpose |
|------|----------|---------|
| Setup Guide | `docs/SETUP.md` | Development setup |
| DB Setup | `docs/DATABASE_SETUP.md` | Database configuration |
| Marketplace Guide | `docs/MARKETPLACE_INTEGRATION.md` | Marketplace integration |
| Structure | `docs/PROJECT_STRUCTURE.md` | Project file structure |
| Summary | `docs/SETUP_SUMMARY.md` | Setup completion summary |

## Commands

### Setup Database
```bash
# Create database
createdb marketplace_analyzer

# Import schema
psql -U postgres -d marketplace_analyzer -f database/schema.sql

# Verify tables
psql -U postgres -d marketplace_analyzer -c "\dt"
```

### Environment Setup
```bash
# Copy env template
cp backend/.env.example backend/.env

# Edit configuration
nano backend/.env
```

### Install Dependencies
```bash
cd backend
npm install
```

### Start Server
```bash
# Development (with auto-reload)
npm run dev

# Production
npm start
```

### Test API
```bash
curl http://localhost:5000/api/health
```

## Database Tables

### 8 Core Tables

1. **users** - Seller accounts
2. **products** - Product catalog  
3. **orders** - Order transactions
4. **cost_configurations** - Marketplace fees
5. **profit_reports** - Monthly summaries
6. **product_performance** - Product analytics
7. **data_uploads** - CSV import history
8. **marketplace_integrations** - API configs

## Environment Variables

```env
# Server
PORT=5000
NODE_ENV=development

# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=marketplace_analyzer
DB_USER=postgres
DB_PASSWORD=your_password

# JWT
JWT_SECRET=your_secret
JWT_EXPIRE=7d

# URLs
API_BASE_URL=http://localhost:5000
FRONTEND_URL=http://localhost:3000

# Marketplace
FLIPKART_API_KEY=xxx
FLIPKART_API_SECRET=xxx

# Logging
LOG_LEVEL=debug

# File Upload
MAX_FILE_SIZE=5242880
UPLOAD_DIR=./uploads
```

## Directory Structure

```
backend/src/
├── config/         → Configuration & DB connection
├── routes/         → API endpoint definitions
├── controllers/    → Request handlers
├── services/       → Business logic
├── models/         → Database queries
├── middleware/     → Middleware functions
└── utils/          → Utility functions

database/
├── schema.sql      → Database schema
├── migrations/     → Migration files
└── seeds/          → Seed data

docs/
├── SETUP.md
├── DATABASE_SETUP.md
├── MARKETPLACE_INTEGRATION.md
├── PROJECT_STRUCTURE.md
└── SETUP_SUMMARY.md
```

## Quick Troubleshooting

### Port 5000 Already in Use
```bash
kill -9 $(lsof -ti:5000)
```

### Database Connection Error
```bash
# Check PostgreSQL running
sudo systemctl status postgresql

# Check credentials in .env
nano backend/.env
```

### npm Install Fails
```bash
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### Database Not Created
```bash
createdb marketplace_analyzer
psql -U postgres -d marketplace_analyzer -f database/schema.sql
```

## Package Scripts

```bash
npm run dev      # Start with nodemon
npm start        # Production start
npm test         # Run tests
npm run migrate  # Database migration
npm run seed     # Seed database
```

## Deployment Checklist

- [ ] Database created and schema imported
- [ ] `.env` configured with production values
- [ ] All dependencies installed
- [ ] Environment variables set
- [ ] Port accessible
- [ ] Database connection tested
- [ ] Server started successfully

## Key URLs

| Endpoint | URL | Purpose |
|----------|-----|---------|
| Health Check | `http://localhost:5000/api/health` | Server status |
| Auth | `http://localhost:5000/api/auth/*` | Authentication |
| Products | `http://localhost:5000/api/products/*` | Product management |
| Orders | `http://localhost:5000/api/orders/*` | Order management |
| Reports | `http://localhost:5000/api/reports/*` | Reports & analytics |

## Helpful Git Commands

```bash
# Initialize git
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial project setup"

# Create feature branch
git checkout -b feature/your-feature

# Push changes
git push origin feature/your-feature
```

## Important Files to Protect

- `backend/.env` - Never commit (contains secrets)
- `backend/node_modules/` - In .gitignore
- `logs/` - In .gitignore
- `uploads/` - In .gitignore

## Notes

- Database uses PostgreSQL (version 12+)
- Server uses Node.js 16+ and Express.js 4.18+
- JWT used for authentication
- All sensitive data in .env (never commit)
- Multi-marketplace support built-in

---

**Setup Date:** March 22, 2026  
**Status:** ✅ Complete  
**Ready For:** Backend API Development
