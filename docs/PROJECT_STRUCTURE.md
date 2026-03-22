## 📁 Project Structure Overview

```
marketplace-analyzer/
│
├── backend/                              # Node.js/Express Backend
│   ├── src/
│   │   ├── index.js                      # Main server entry point
│   │   │
│   │   ├── config/
│   │   │   ├── index.js                  # Configuration loader
│   │   │   └── database.js               # PostgreSQL connection pool
│   │   │
│   │   ├── routes/                       # API endpoint definitions
│   │   │   ├── authRoutes.js            # Auth endpoints (signup, login)
│   │   │   ├── productRoutes.js         # Product CRUD operations
│   │   │   ├── orderRoutes.js           # Order management
│   │   │   ├── costRoutes.js            # Cost configuration
│   │   │   ├── reportRoutes.js          # Reports and analytics
│   │   │   ├── uploadRoutes.js          # CSV upload endpoints
│   │   │   └── marketplaceRoutes.js     # Marketplace integration
│   │   │
│   │   ├── controllers/                  # Request handlers
│   │   │   ├── authController.js        # Authentication logic
│   │   │   ├── productController.js     # Product operations
│   │   │   ├── orderController.js       # Order processing
│   │   │   ├── costController.js        # Cost management
│   │   │   ├── reportController.js      # Report generation
│   │   │   └── uploadController.js      # File upload handling
│   │   │
│   │   ├── services/                     # Business logic & core algorithms
│   │   │   ├── authService.js           # Auth operations
│   │   │   ├── productService.js        # Product operations
│   │   │   ├── profitCalculationEngine.js # ⭐ CORE - Profit calculation
│   │   │   ├── orderService.js          # Order processing
│   │   │   ├── reportService.js         # Report generation
│   │   │   ├── csvImportService.js      # CSV parsing and import
│   │   │   ├── insightService.js        # Insights generation
│   │   │   └── flipkart/                # Flipkart-specific services
│   │   │       ├── flipkartAPI.js       # Flipkart API calls
│   │   │       └── flipkartSync.js      # Data synchronization
│   │   │
│   │   ├── models/                       # Database queries & models
│   │   │   ├── User.js                  # User operations
│   │   │   ├── Product.js               # Product queries
│   │   │   ├── Order.js                 # Order queries
│   │   │   ├── CostConfig.js            # Cost configuration queries
│   │   │   └── Report.js                # Report queries
│   │   │
│   │   ├── middleware/                   # Express middleware
│   │   │   ├── auth.js                  # JWT verification
│   │   │   ├── errorHandler.js          # Global error handling
│   │   │   ├── validation.js            # Input validation
│   │   │   └── logging.js               # Request/response logging
│   │   │
│   │   └── utils/                        # Utility functions
│   │       ├── logger.js                # Logging utility
│   │       ├── validators.js            # Data validation functions
│   │       ├── formatters.js            # Data formatting
│   │       └── helpers.js               # Helper functions
│   │
│   ├── package.json                      # Node dependencies
│   ├── .env.example                      # Environment template
│   └── .env                              # Environment variables (git ignored)
│
├── frontend/                             # React/Vue Frontend (TBD)
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── utils/
│   └── package.json
│
├── database/                             # Database schema & migrations
│   ├── schema.sql                        # Database tables definition
│   ├── init.sql                          # Database initialization
│   ├── knexfile.js                       # Migration config
│   ├── migrations/                       # Migration files
│   │   ├── 001_create_users_table.sql
│   │   ├── 002_create_products_table.sql
│   │   └── ...
│   └── seeds/                            # Seed data for testing
│       └── sample_data.sql
│
├── config/                               # Shared configuration files
│   └── constants.js                      # Application constants
│
├── docs/                                 # Documentation
│   ├── SETUP.md                          # Development setup guide
│   ├── DATABASE_SETUP.md                 # Database configuration guide
│   ├── MARKETPLACE_INTEGRATION.md        # Marketplace integration guide
│   ├── API_ENDPOINTS.md                  # API documentation (TBD)
│   └── ARCHITECTURE.md                   # System architecture (TBD)
│
├── .gitignore                            # Git ignore rules
├── .env.example                          # Root env template
├── README.md                             # Project overview
└── package.json                          # Root package (for workspaces)
```

## 🎯 Key Directories Explained

### `backend/src/config/`
- Environment configuration loading
- Database connection pooling
- Settings management

### `backend/src/services/`
- **Core Business Logic** - Where all calculations happen
- `profitCalculationEngine.js` - Main profit calculation algorithm
- Flipkart integration services
- Report generation logic

### `backend/src/middleware/`
- JWT authentication verification
- Request validation
- Error handling
- CORS and security

### `database/`
- Complete schema with all 8 tables
- Indexes for performance
- Migration system ready

### `docs/`
- Setup instructions
- Architecture documentation
- Marketplace integration guide

## 📊 Database Tables

```
Users
├── user accounts
├── business info
└── authentication

Products
├── product catalog
├── cost/selling prices
└── inventory

Orders
├── order records
├── return tracking
└── marketplace reference

Cost Configurations
├── platform fees
├── shipping costs
└── per-marketplace settings

Profit Reports
├── monthly summaries
├── cost breakdowns
└── net profit

Product Performance
├── product-wise analytics
├── monthly metrics
└── profit margins

Data Uploads
├── CSV import history
└── processing status

Marketplace Integrations
├── API credentials
├── sync status
└── integration config
```

## 🚀 Development Flow

```
1. User submits form (React)
   ↓
2. API Route receives request (routes/)
   ↓
3. Middleware validates & authenticates (middleware/)
   ↓
4. Controller processes request (controllers/)
   ↓
5. Service executes business logic (services/)
   ↓
6. Model queries database (models/)
   ↓
7. Response sent back to frontend (JSON)
```

## 📝 Code Organization Principles

### Controllers
- Handle HTTP request/response
- Call appropriate services
- Return formatted responses

### Services
- All business logic
- Profit calculations
- Data transformations
- External API calls

### Models
- SQL query execution
- Database operations only
- No business logic

### Middleware
- Request validation
- Authentication
- Error handling
- Logging

### Utils
- Reusable functions
- Validators
- Formatters
- Helpers

## 🔄 Marketplace Architecture

Currently **Flipkart-focused**, multi-marketplace ready:

```
Services/
├── flipkart/
│   ├── flipkartAPI.js       (API calls)
│   └── flipkartSync.js      (Data sync)
├── (shopify/)               (Future)
├── (amazon/)                (Future)
└── marketplace.js           (Common interface)
```

Each marketplace can be added independently with its own service layer.

---

**Status:** ✅ Structure Complete & Dependencies Installed  
**Date:** March 22, 2026  
**Ready For:** Backend API Development
