# Use official Node.js runtime as a parent image
FROM node:18-alpine


# Create app directory
WORKDIR /usr/src/app


# Copy package.json and package-lock (if present)
COPY package*.json ./


# Install dependencies
RUN npm ci --only=production || npm install --only=production


# Copy app sources
COPY . .


# Expose port
EXPOSE 3000


# Start the app
CMD ["node", "app.js"]
