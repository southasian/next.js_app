# Use the latest Node.js LTS version as the base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install build tools for any native dependencies
RUN apt-get update && apt-get install -y \
  python3 \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json
COPY package*.json ./

RUN sudo apt-get install npm

# Install dependencies
# Adding additional debug flags to npm install
RUN npm install --legacy-peer-deps --verbose

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port Next.js is running on
EXPOSE 3000

# Command to run the Next.js app in production mode
CMD ["npm", "start"]
