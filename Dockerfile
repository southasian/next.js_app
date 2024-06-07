# Use the latest Node.js LTS version as the base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json 
COPY package.json .
COPY package-lock.json .

RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the port Next.js is running on
EXPOSE 3000

# Command to run the Next.js app in production mode
CMD ["npm", "start"]
