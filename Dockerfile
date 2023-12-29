# Stage 1: Build the React application
FROM node:latest as build
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Copy the build output from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Create a directory for SSL certificates
RUN mkdir /etc/nginx/ssl

# Copy Nginx configuration with SSL settings (assuming you have an nginx.conf file in your project)
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for SSL
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
