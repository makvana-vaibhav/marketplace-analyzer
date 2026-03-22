// Logger utility
const fs = require('fs');
const path = require('path');

const logDir = path.join(__dirname, '../../logs');

// Create logs directory if it doesn't exist
if (!fs.existsSync(logDir)) {
  fs.mkdirSync(logDir, { recursive: true });
}

const logLevels = {
  ERROR: 'ERROR',
  WARN: 'WARN',
  INFO: 'INFO',
  DEBUG: 'DEBUG',
};

const log = (level, message, data = null) => {
  const timestamp = new Date().toISOString();
  const logMessage = `[${timestamp}] [${level}] ${message}`;
  
  if (data) {
    console.log(logMessage, JSON.stringify(data, null, 2));
  } else {
    console.log(logMessage);
  }

  // Also write to file
  const logFile = path.join(logDir, `${level.toLowerCase()}.log`);
  fs.appendFileSync(logFile, logMessage + (data ? '\n' + JSON.stringify(data, null, 2) : '') + '\n');
};

module.exports = {
  error: (message, data) => log(logLevels.ERROR, message, data),
  warn: (message, data) => log(logLevels.WARN, message, data),
  info: (message, data) => log(logLevels.INFO, message, data),
  debug: (message, data) => log(logLevels.DEBUG, message, data),
};
