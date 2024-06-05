# Use an official Node runtime as a base image
FROM node:14

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Bundle app source
COPY . .

# Build the app
RUN npm run build

# Use serve to serve the build folder on port 5000
RUN npm install -g serve
CMD serve -s build -l 5000

# Make port 5000 available to the world outside this container
EXPOSE 5000