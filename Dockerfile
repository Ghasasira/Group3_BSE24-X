# Step 1: Build the React app
FROM node:20.18.0-alpine3.20
WORKDIR /app
COPY ./netflix-ui/build ./netflix-ui/
RUN npm install -g serve
RUN serve -s netflix-ui &
EXPOSE 3000

# Step 2: Set up the Node.js backend
WORKDIR /app
COPY ./netflix-api/package*.json ./
RUN npm install

# Copy the backend code
COPY ./netflix-api .

# Expose the port your backend will run on
EXPOSE 5000

# Start the backend server
CMD ["npm","run","start"]
