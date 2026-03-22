-- Users Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(150),
    business_name VARCHAR(150),
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    marketplace_type VARCHAR(50) DEFAULT 'flipkart',
    verified BOOLEAN DEFAULT false,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    product_name VARCHAR(255) NOT NULL,
    sku VARCHAR(100) UNIQUE NOT NULL,
    cost_price DECIMAL(10, 2) NOT NULL,
    selling_price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    marketplace_product_id VARCHAR(255),
    marketplace_link TEXT,
    current_stock INTEGER DEFAULT 0,
    reorder_level INTEGER DEFAULT 10,
    supplier_name VARCHAR(150),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cost Configuration Table
CREATE TABLE cost_configurations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    marketplace VARCHAR(50) DEFAULT 'flipkart',
    platform_commission_percentage DECIMAL(5, 2) NOT NULL,
    shipping_cost DECIMAL(10, 2) DEFAULT 0,
    packaging_cost DECIMAL(10, 2) DEFAULT 0,
    return_percentage DECIMAL(5, 2) DEFAULT 0,
    other_costs DECIMAL(10, 2) DEFAULT 0,
    storage_cost DECIMAL(10, 2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, marketplace)
);

-- Orders Table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    order_id VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    quantity INTEGER NOT NULL,
    order_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    returned BOOLEAN DEFAULT false,
    return_reason VARCHAR(255),
    return_date DATE,
    marketplace_order_id VARCHAR(255),
    marketplace VARCHAR(50) DEFAULT 'flipkart',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, marketplace_order_id)
);

-- Profit Report Table
CREATE TABLE profit_reports (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    report_date DATE NOT NULL,
    total_orders INTEGER,
    total_revenue DECIMAL(15, 2),
    total_cost DECIMAL(15, 2),
    platform_fees DECIMAL(15, 2),
    shipping_cost DECIMAL(15, 2),
    packaging_cost DECIMAL(15, 2),
    return_losses DECIMAL(15, 2),
    other_expenses DECIMAL(15, 2),
    net_profit DECIMAL(15, 2),
    profit_margin_percentage DECIMAL(5, 2),
    month VARCHAR(7),
    year INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, report_date)
);

-- Product Performance Table
CREATE TABLE product_performance (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    month VARCHAR(7),
    year INTEGER,
    total_units_sold INTEGER DEFAULT 0,
    total_revenue DECIMAL(15, 2) DEFAULT 0,
    total_cost DECIMAL(15, 2) DEFAULT 0,
    platform_fees DECIMAL(15, 2) DEFAULT 0,
    return_count INTEGER DEFAULT 0,
    return_losses DECIMAL(15, 2) DEFAULT 0,
    net_profit DECIMAL(15, 2) DEFAULT 0,
    profit_margin DECIMAL(5, 2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, product_id, month, year)
);

-- Data Upload History Table
CREATE TABLE data_uploads (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    file_name VARCHAR(255),
    file_path TEXT,
    file_type VARCHAR(50),
    records_count INTEGER,
    status VARCHAR(50),
    error_message TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    processed_at TIMESTAMP
);

-- Marketplace Integration Table
CREATE TABLE marketplace_integrations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    marketplace VARCHAR(50) NOT NULL,
    api_key VARCHAR(255),
    api_secret VARCHAR(255),
    store_id VARCHAR(255),
    is_active BOOLEAN DEFAULT true,
    last_synced TIMESTAMP,
    sync_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, marketplace)
);

-- Create Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_products_user_id ON products(user_id);
CREATE INDEX idx_products_sku ON products(sku);
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_product_id ON orders(product_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_profit_reports_user_id ON profit_reports(user_id);
CREATE INDEX idx_profit_reports_month ON profit_reports(month, year);
CREATE INDEX idx_product_performance_user_id ON product_performance(user_id);
