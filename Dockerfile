# First stage: Build Stage
FROM node:16 AS build-stage

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker cache for dependencies
COPY package*.json ./

# Install dependencies (including development dependencies)
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Second stage: Final Stage
FROM node:16-slim AS final-stage

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary files from the build stage (node_modules and app.js)
COPY --from=build-stage /app/node_modules /app/node_modules
COPY --from=build-stage /app/app.js /app/app.js

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to run the app when the container starts
CMD ["node", "app.js"]
