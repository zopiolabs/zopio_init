# Test Dockerfile for container security scanning
# Contains intentional issues for testing

# Using old Node.js version with known vulnerabilities
FROM node:8.9.0

# Running as root (security risk)
USER root

# Exposing unnecessary ports
EXPOSE 22 23 3389

# Installing packages without specifying versions
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    netcat

# Copying everything including potential secrets
COPY . /app

# Setting insecure environment variables
ENV NODE_ENV=production
ENV API_KEY=hardcoded-api-key-123
ENV DB_PASSWORD=admin123

# Wide permissions
RUN chmod -R 777 /app

# No health check defined
WORKDIR /app

# Running with elevated privileges
CMD ["node", "index.js"]