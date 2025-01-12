# Use an official Node runtime as a parent image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install dependencies
RUN npm ci --only=production

# Expose the frontend application on port 3000
EXPOSE 3000

# Start the frontend application
CMD ["npm", "start"]

