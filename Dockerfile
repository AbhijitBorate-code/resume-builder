# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the project
COPY . .

# Expose port (React default is 3000)
EXPOSE 3000

# Start React dev server
CMD ["npm", "start"]
