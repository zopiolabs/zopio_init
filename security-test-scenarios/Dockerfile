# Intentionally using old Node.js version with known vulnerabilities
FROM node:10.16.0-alpine

# Install vulnerable packages at OS level
RUN apk add --no-cache \
    python2 \
    make \
    g++

WORKDIR /app

# Copy vulnerable package.json
COPY vulnerable-package.json package.json

# Install dependencies (including vulnerable ones)
RUN npm install

# Copy application files
COPY . .

# Run as root (security issue)
USER root

# Expose port
EXPOSE 3000

# Start application
CMD ["node", "sql-injection.js"]