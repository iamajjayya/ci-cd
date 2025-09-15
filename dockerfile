# Use Nginx as base image
FROM nginx:alpine

# Copy HTML file to nginx html folder
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
