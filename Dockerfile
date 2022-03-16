FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
#Not in tutorial
RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache
COPY . .
CMD npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
