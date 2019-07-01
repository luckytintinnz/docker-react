# Build package
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#  fetch nginx and copy over build files
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
