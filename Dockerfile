# Use the official Node.js image
FROM node:18

# Install FFMPEG
RUN apt-get update && \
    apt-get install -y ffmpeg

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the ports for RTMP and HTTP
EXPOSE 1935
EXPOSE 8000

# Start the Node.js application
CMD ["node", "server.js"]
