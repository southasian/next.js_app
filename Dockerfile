# Use official Node.js image as base
FROM node:16-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json .
COPY package-lock.json .

RUN sudo apt-get install npm
# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the port Next.js will run on (usually 3000)
EXPOSE 3000

# Command to run the Next.js application
CMD ["npm", "start"]
