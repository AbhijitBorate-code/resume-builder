# Use latest stable Node.js version
FROM node:current

# Create app directory inside container
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app
COPY . .

# Build the app (optional, if you have a build step)
RUN npm run build

# Expose port (adjust to your app, e.g., 3000 or 8080)
EXPOSE 3000

# Start the app (ensure you have "start" script in package.json)
CMD ["npm", "start"]
