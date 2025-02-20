# Step 1: Use Node.js official image as base
FROM node:16-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Install global dependencies (like typescript)
RUN npm install -g typescript

# Step 4: Copy package.json and package-lock.json to the container
COPY package*.json ./

# Step 5: Install project dependencies
RUN npm install --legacy-peer-deps

# Step 6: Copy the rest of the project files to the container
COPY . .

# Step 7: Build the TypeScript files into JavaScript
RUN tsc

# Step 8: Expose the port the app runs on
EXPOSE 3000

# Step 9: Start the application (you can modify this according to how your project runs)
CMD ["npm", "start"]
