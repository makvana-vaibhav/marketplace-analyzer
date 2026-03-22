# Database Setup Guide

## Prerequisites
- PostgreSQL 12 or higher installed
- psql command-line tool available

## Steps to Setup Database

### 1. Create Database

```bash
# Connect to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE marketplace_analyzer;

# Exit psql
\q
```

Or use a single command:
```bash
createdb marketplace_analyzer -U postgres
```

### 2. Run Schema

```bash
# From project root directory
psql -U postgres -d marketplace_analyzer -f database/schema.sql
```

### 3. Verify Tables Created

```bash
# Connect to database
psql -U postgres -d marketplace_analyzer

# List tables
\dt

# Check specific table structure
\d users

# Exit
\q
```

## Environment Configuration

Create `.env` file in backend directory:

```bash
cp backend/.env.example backend/.env
```

Edit `backend/.env`:

```env
# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=marketplace_analyzer
DB_USER=postgres
DB_PASSWORD=your_password

# Server
PORT=5000
NODE_ENV=development

# JWT
JWT_SECRET=your-super-secret-jwt-key-change-this

# API URLs
API_BASE_URL=http://localhost:5000
FRONTEND_URL=http://localhost:3000
```

## Testing Database Connection

```bash
# From backend directory
node -e "
const config = require('./src/config');
const pool = require('./src/config/database');
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Connection failed:', err);
  } else {
    console.log('Database connected successfully at:', res.rows[0].now);
  }
  process.exit();
});
"
```

## Database Tables Overview

### Users Table
- Stores seller accounts
- Email unique, verified status

### Products Table
- Product catalog per seller
- Cost and selling prices
- Stock levels

### Orders Table
- Order records per product
- Status tracking (delivered, returned, etc.)
- Return information

### Cost Configurations Table
- Platform-specific settings per seller
- Commissions, shipping, packaging costs

### Profit Reports Table
- Monthly profit summaries
- All cost breakdowns
- Net profit calculations

### Product Performance Table
- Product-wise monthly analytics
- Revenue, costs, profit margins

### Data Uploads Table
- CSV upload history
- Processing status

### Marketplace Integrations Table
- API credentials (encrypted in production)
- Sync status and timestamps

## Backup & Restore

### Backup
```bash
pg_dump -U postgres -d marketplace_analyzer > backup.sql
```

### Restore
```bash
psql -U postgres -d marketplace_analyzer < backup.sql
```

## Resetting Database (Development Only)

```bash
# Drop and recreate
dropdb marketplace_analyzer -U postgres
createdb marketplace_analyzer -U postgres
psql -U postgres -d marketplace_analyzer -f database/schema.sql
```

## Troubleshooting

### Connection Refused
- Ensure PostgreSQL service is running: `sudo systemctl status postgresql`
- Check DB_HOST and DB_PORT in .env

### Authentication Failed
- Verify DB_USER and DB_PASSWORD
- Check PostgreSQL pg_hba.conf if using custom auth

### Schema Import Failed
- Check file path is correct
- Ensure database exists before importing
- Check for SQL syntax errors in schema.sql

## Next Steps
1. Create database
2. Run schema
3. Configure .env
4. Start backend server
5. API should be ready at http://localhost:5000

---
For more help, check README.md in root directory.
