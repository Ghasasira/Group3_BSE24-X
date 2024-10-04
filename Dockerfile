# Step 1: Build the React app
FROM node:16-alpine as frontend
WORKDIR /app
COPY ./netflix-ui/package*.json ./netflix-ui/
RUN cd netflix-ui && npm install
COPY ./netflix-ui ./netflix-ui
RUN cd netflix-ui && npm run build

# Step 2: Set up the Node.js backend
FROM node:16-alpine
WORKDIR /app
COPY ./netflix-api/package*.json ./
RUN npm install

# Copy built frontend into the backend public directory
COPY --from=frontend /app/netflix-ui/build ./public

# Copy the backend code
COPY ./netflix-api .

# Expose the port your backend will run on
EXPOSE 5000

# Start the backend server
CMD ["npm", "run", "start"]

