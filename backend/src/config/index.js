// Configuration loader
require('dotenv').config();

const config = {
  port: process.env.PORT || 5000,
  nodeEnv: process.env.NODE_ENV || 'development',
  
  database: {
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5432,
    name: process.env.DB_NAME || 'marketplace_analyzer',
    user: process.env.DB_USER || 'postgres',
    password: process.env.DB_PASSWORD,
  },

  jwt: {
    secret: process.env.JWT_SECRET || 'your_jwt_secret_key',
    expire: process.env.JWT_EXPIRE || '7d',
  },

  api: {
    baseUrl: process.env.API_BASE_URL || 'http://localhost:5000',
    frontendUrl: process.env.FRONTEND_URL || 'http://localhost:3000',
  },

  marketplace: {
    flipkart: {
      apiKey: process.env.FLIPKART_API_KEY,
      apiSecret: process.env.FLIPKART_API_SECRET,
    },
  },

  email: {
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    user: process.env.SMTP_USER,
    password: process.env.SMTP_PASSWORD,
  },

  file: {
    maxSize: parseInt(process.env.MAX_FILE_SIZE) || 5242880,
    uploadDir: process.env.UPLOAD_DIR || './uploads',
  },
};

module.exports = config;
