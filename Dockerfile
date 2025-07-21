# 🔧 Stage 1: Build Angular App
FROM node:18 AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install -g @angular/cli
RUN npm install

# Copy all project files & build
COPY . .
RUN ng build --configuration production

# 🌐 Stage 2: Serve with NGINX
FROM nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy Angular build output to NGINX html folder
COPY --from=builder /app/dist/resume/browser /usr/share/nginx/html

# (Optional) Custom nginx.conf
# If you want to support Angular routing, add this:
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose default HTTP port
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
# 🔧 Stage 1: Build Angular App
# FROM node:18 AS builder

# WORKDIR /app

# # Install dependencies
# COPY package*.json ./
# RUN npm install -g @angular/cli
# RUN npm install

# # Copy all project files & build
# COPY . .
# RUN ng build --configuration production

# # 🌐 Stage 2: Serve with NGINX
# FROM nginx:alpine

# # Remove default nginx page
# RUN rm -rf /usr/share/nginx/html/*

# # Copy Angular build output to NGINX html folder
# COPY --from=builder /app/dist/resume/browser /usr/share/nginx/html

# # (Optional) Custom nginx.conf
# # If you want to support Angular routing, add this:
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# # Expose default HTTP port
# EXPOSE 80

# # Start NGINX server
# CMD ["nginx", "-g", "daemon off;"]
