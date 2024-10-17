# Step 1: Build the React app
FROM node:20.18.0-alpine3.20
WORKDIR /app
COPY ./netflix-ui/build ./netflix-ui/
RUN npm install -g serve

# Step 2: Set up the Node.js backend
WORKDIR /app
COPY ./netflix-api/package*.json ./
RUN npm install

# Copy the backend code
COPY ./netflix-api .

# Expose the ports your app will run on
# frontend
EXPOSE 3000
# backend
EXPOSE 5000

COPY start.sh .
RUN chmod +x start.sh

# Start the backend server
ENTRYPOINT ["sh","/app/start.sh"]
