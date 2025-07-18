FROM debian:trixie-backports

# Always good practice
RUN apt-get update && apt-get upgrade -y

# Optional: Install Node.js manually from NodeSource (example for Node 18)
RUN apt-get install -y curl gnupg \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs

# Install any build tools needed for React
RUN apt-get install -y git build-essential

# Copy your React code and build it
WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

# Optional: use nginx or serve if you're deploying a static build
