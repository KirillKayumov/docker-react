FROM node:alpine AS builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
