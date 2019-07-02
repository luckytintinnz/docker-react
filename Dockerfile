# Build package
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#  fetch nginx and copy over build files
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
