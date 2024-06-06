# Use node:latest as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
ADD package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port Next.js is running on (by default, it's 3000)
EXPOSE 3000

# Command to run the Next.js app in production mode
CMD ["npm", "start"]
