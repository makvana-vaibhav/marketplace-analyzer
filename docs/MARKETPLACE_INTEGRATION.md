# Flipkart Marketplace Integration Guide

## Overview
This guide explains how the platform currently supports Flipkart and how to extend it for other marketplaces.

## Current Support: Flipkart

### Flipkart Integration Points

#### 1. Configuration
- Store API credentials in `.env`
```env
FLIPKART_API_KEY=your_key
FLIPKART_API_SECRET=your_secret
```

#### 2. Marketplace Integration Table
Stores per-user Flipkart integration:
- `marketplace` = 'flipkart'
- `api_key`, `api_secret` encrypted
- `store_id` for Flipkart seller ID
- `last_synced` timestamp
- `sync_status` (pending, syncing, completed, failed)

#### 3. Unique Marketplace Fields
- `marketplace_product_id` - Flipkart SKU/product ID
- `marketplace_product_link` - Direct Flipkart URL
- `marketplace_order_id` - Flipkart order number

## Flipkart API Features (To Implement)

### Available APIs
1. **Product APIs**
   - Upload products
   - Update inventory
   - Fetch product details

2. **Order APIs**
   - Fetch orders
   - Update order status
   - Track shipments

3. **Inventory APIs**
   - Real-time stock sync
   - Bulk updates

### Sample Flipkart Integration Points

```javascript
// services/flipkartService.js
async function fetchOrders(storeId, apiKey) {
  // Call Flipkart API
  // Parse response
  // Store in database
}

async function syncProducts(userId) {
  // Fetch integration credentials
  // Get products from Flipkart
  // Update local database
}
```

## Multi-Marketplace Architecture

### Design Pattern

```
marketplace-analyzer/
├── backend/src/
│   ├── services/
│   │   ├── flipkart/          # Flipkart-specific logic
│   │   │   ├── flipkartAPI.js
│   │   │   ├── flipkartSync.js
│   │   │   └── index.js
│   │   ├── shopify/           # (Future) Shopify logic
│   │   ├── amazon/            # (Future) Amazon logic
│   │   └── marketplace.js     # Common interface
│   └── ...
```

### Common Interface Pattern

```javascript
// services/marketplace.js
class MarketplaceAdapter {
  constructor(type, credentials) {
    this.type = type; // 'flipkart', 'shopify', etc
    this.credentials = credentials;
  }

  async fetchOrders() { }
  async fetchProducts() { }
  async updateInventory() { }
  async syncData() { }
}

// Usage
const adapter = new MarketplaceAdapter('flipkart', {
  apiKey: '...',
  apiSecret: '...',
});

const orders = await adapter.fetchOrders();
```

## Adding New Marketplace (Future)

### Steps to Add Shopify (Example)

1. **Create Shopify Service**
```bash
mkdir backend/src/services/shopify
touch backend/src/services/shopify/shopifyAPI.js
touch backend/src/services/shopify/shopifySync.js
```

2. **Implement API Adapter**
```javascript
// services/shopify/shopifyAPI.js
class ShopifyAPI {
  constructor(storeUrl, apiKey) {
    this.storeUrl = storeUrl;
    this.apiKey = apiKey;
  }

  async getOrders() {
    // Shopify REST API call
  }
}
```

3. **Update Cost Configuration**
```sql
-- Cost configurations already support 'marketplace' field
-- Just insert Shopify rates:
INSERT INTO cost_configurations 
VALUES (user_id, 'shopify', 3.5, 0, 10, 2, 0, 0);
```

4. **Update Orders Table**
```sql
-- Already has marketplace field
-- Just filter by marketplace = 'shopify'
```

## Database Considerations

### Multi-Marketplace Queries

```sql
-- Get all orders across marketplaces
SELECT * FROM orders WHERE user_id = 1;

-- Get Flipkart-only orders
SELECT * FROM orders WHERE user_id = 1 AND marketplace = 'flipkart';

-- Get Shopify-only orders
SELECT * FROM orders WHERE user_id = 1 AND marketplace = 'shopify';

-- Aggregated profit across all marketplaces
SELECT 
  SUM(total_revenue) as total_revenue,
  SUM(net_profit) as total_profit
FROM profit_reports 
WHERE user_id = 1;
```

## Profit Calculation by Marketplace

### Cost Configuration
Each marketplace has its own costs:

```javascript
// Get Flipkart costs for user
const flipkartCosts = await getCostConfig(userId, 'flipkart');
// { commission: 8%, shipping: 0, packaging: 5, returns: 2% }

// Get Shopify costs for user
const shopifyCosts = await getCostConfig(userId, 'shopify');
// { commission: 2.9%, shipping: 2, packaging: 5, returns: 1% }
```

### Separate Reports
```javascript
// Profit only from Flipkart
const flipkartProfit = calculateProfit(flipkartOrders, flipkartCosts);

// Profit only from Shopify
const shopifyProfit = calculateProfit(shopifyOrders, shopifyCosts);

// Combined dashboard
const totalProfit = flipkartProfit + shopifyProfit;
```

## Current Development Status

### ✅ Implemented
- [x] Flipkart marketplace field in database
- [x] Integration table with API credentials storage
- [x] Multi-marketplace cost configuration support
- [x] Order marketplace tracking

### 🚧 To Implement
- [ ] Flipkart API integration service
- [ ] OAuth2 for Flipkart authentication
- [ ] Real-time order sync
- [ ] Product sync from Flipkart
- [ ] Shopify integration
- [ ] Amazon integration

## Environment Variables per Marketplace

```env
# Flipkart
FLIPKART_API_KEY=xxx
FLIPKART_API_SECRET=xxx
FLIPKART_BASE_URL=https://api.flipkart.com

# Shopify (Future)
SHOPIFY_API_KEY=xxx
SHOPIFY_API_SECRET=xxx
SHOPIFY_BASE_URL=https://{shop}.myshopify.com/admin/api

# Amazon (Future)
AMAZON_SELLER_ID=xxx
AMAZON_MWS_TOKEN=xxx
AMAZON_BASE_URL=https://mws.amazonservices.com
```

## Testing Multi-Marketplace Setup

### Unit Tests
```javascript
// tests/services/flipkart.test.js
describe('Flipkart Service', () => {
  it('should fetch orders correctly', async () => {
    // Mock Flipkart API
    // Test order parsing
    // Verify database storage
  });
});
```

### Integration Tests
```javascript
// tests/integration/multiMarketplace.test.js
describe('Multi-Marketplace', () => {
  it('should calculate profit across marketplaces', async () => {
    // Create user
    // Add Flipkart orders
    // Add Shopify orders
    // Calculate combined profit
    // Assert correct totals
  });
});
```

## Next Steps

1. Implement Flipkart API service
2. Create API integration routes
3. Build OAuth2 authentication for Flipkart
4. Implement order sync job
5. Plan Shopify integration

---

**Platform Status:** Flipkart-focused, multi-marketplace ready  
**Last Updated:** March 22, 2026
