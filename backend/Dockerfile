# Use an official Node runtime as a parent image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install dependencies
RUN npm ci --only=production

# Expose the backend application on port 8080
EXPOSE 8080

# Start the backend application
CMD ["npm", "start"]

