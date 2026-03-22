# Marketplace Profit Analyzer

> An E-commerce Profit Analytics Platform for marketplace sellers to track real profit by combining product costs, platform fees, returns, and operational expenses.

## 🎯 Project Overview

This is a comprehensive SaaS solution for marketplace sellers (Flipkart, Shopify, etc.) to understand their true profitability across products and orders.

### Core Features
- **Product Management** - Track cost price, selling price, and categories
- **Cost Configuration** - Set platform commission, shipping, packaging costs
- **Order Tracking** - Manage orders and returns
- **Profit Calculation** - Automated profit computation engine
- **Dashboard & Insights** - Visual analytics and performance metrics
- **Data Import** - CSV upload for bulk data
- **Multi-Marketplace** - Currently supporting Flipkart (expandable)

## 📁 Project Structure

```
marketplace-analyzer/
├── backend/                    # Node.js/Express backend
│   ├── src/
│   │   ├── index.js           # Server entry point
│   │   ├── config/            # Configuration files
│   │   ├── routes/            # API routes
│   │   ├── controllers/        # Request handlers
│   │   ├── models/            # Data models
│   │   ├── services/          # Business logic
│   │   ├── middleware/        # Custom middleware
│   │   └── utils/             # Utility functions
│   ├── package.json           # Dependencies
│   └── .env.example           # Environment template
├── frontend/                   # React/Vue frontend (TBD)
├── database/
│   ├── schema.sql             # Database schema
│   ├── migrations/            # Database migrations
│   ├── seeds/                 # Seed data
│   └── knexfile.js            # Database config
├── config/                     # Shared configurations
├── docs/                       # Documentation
├── .env.example               # Root environment template
└── .gitignore

```

## 🚀 Quick Start

### Prerequisites
- Node.js 16+
- PostgreSQL 12+
- npm or yarn

### Setup Instructions

#### 1. Clone and Install Dependencies

```bash
cd marketplace-analyzer
npm install --prefix backend
```

#### 2. Database Setup

```bash
# Create database
createdb marketplace_analyzer

# Run schema
psql -U postgres -d marketplace_analyzer -f database/schema.sql
```

#### 3. Environment Configuration

```bash
# Copy env template
cp backend/.env.example backend/.env

# Edit .env with your values
nano backend/.env
```

**Required Environment Variables:**
- `DB_HOST` - PostgreSQL host
- `DB_PORT` - PostgreSQL port
- `DB_NAME` - Database name
- `DB_USER` - Database user
- `DB_PASSWORD` - Database password
- `JWT_SECRET` - JWT signing secret
- `PORT` - Server port (default: 5000)

#### 4. Start Server

```bash
# Development
npm run dev --prefix backend

# Production
npm start --prefix backend
```

Server will run at `http://localhost:5000`

## 📊 Database Schema

### Core Tables
- **users** - User accounts and business info
- **products** - Product catalog with costs
- **orders** - Order records and status
- **cost_configurations** - Platform fees and operational costs
- **profit_reports** - Monthly profit summaries
- **product_performance** - Product-wise analytics
- **data_uploads** - CSV upload history
- **marketplace_integrations** - API integrations

## 🔌 API Endpoints (To Be Implemented)

### Authentication
- `POST /api/auth/signup` - Register new user
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout

### Products
- `GET /api/products` - List all products
- `POST /api/products` - Create product
- `PUT /api/products/:id` - Update product
- `DELETE /api/products/:id` - Delete product

### Orders
- `GET /api/orders` - List orders
- `POST /api/orders` - Create order
- `PUT /api/orders/:id` - Update order status

### Reports
- `GET /api/reports/dashboard` - Dashboard metrics
- `GET /api/reports/monthly` - Monthly profit report
- `GET /api/reports/product/:id` - Product performance

### Data Upload
- `POST /api/uploads/csv` - Upload CSV data
- `GET /api/uploads/history` - Upload history

## 🛠️ Tech Stack

### Backend
- **Framework** - Express.js
- **Database** - PostgreSQL
- **Authentication** - JWT
- **File Upload** - Multer
- **Validation** - express-validator
- **Security** - Helmet, CORS

### Frontend (TBD)
- React / Vue.js
- Tailwind CSS / Material-UI
- Chart.js / ApexCharts

## 📝 Development Workflow

### Running Tests
```bash
npm test --prefix backend
```

### Database Migrations
```bash
npm run migrate --prefix backend
npm run seed --prefix backend
```

### Code Structure
- Services handle business logic
- Controllers handle HTTP requests
- Models manage data access
- Middleware handles cross-cutting concerns
- Utils provide helper functions

## 🔒 Security Considerations

- ✅ JWT authentication
- ✅ Password hashing with bcrypt
- ✅ CORS enabled
- ✅ Helmet for HTTP headers
- ✅ Environment variables for secrets
- ✅ Input validation
- ✅ SQL injection prevention with parameterized queries

## 📈 Future Enhancements

- [ ] Shopify integration
- [ ] Amazon Seller integration
- [ ] Advanced analytics & ML insights
- [ ] Email reports
- [ ] Multi-currency support
- [ ] Role-based access control
- [ ] Mobile app
- [ ] Real-time notifications

## 🤝 Contributing

Please follow the project structure and coding conventions when contributing.

## 📄 License

MIT License - See LICENSE file for details

## 📞 Support

For issues or questions, please create an issue in the repository.

---

**Created on:** March 22, 2026
**Status:** Initial Setup Complete
# marketplace-analyzer
