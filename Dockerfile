## [1. Build Stage]
# Use an official Node.js runtime as a parent image
FROM node:20.17.0 AS builder

# Set the working directory
WORKDIR /app

# Bundle app source
COPY package*.json ./
COPY yarn.lock ./

# Install Node.js dependencies
RUN yarn install --verbose

# Copy all files from the current directory to the working directory (/app)
COPY . .

# Build application
RUN yarn build

## [2. Runtime Stage]
# Use an official Node.js as runtime image
FROM node:20.17.0

# Set the working directory
WORKDIR /app

# Copy the application build from the previous stage
COPY --from=builder /app .

# Expose application's port
EXPOSE ${PORT}

# Start application
CMD ["yarn", "start:prod"]
