
# Build Phase 
FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 
# /app/build are the files we want to copy over to the nginx container 

# Run Phase 
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html 
# Do not need to run a command as NGINX container will automatically run & serve content 






