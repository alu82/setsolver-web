# build stage
FROM node:lts-alpine as build-stage
WORKDIR /setsolver-web
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx_revproxy.conf.template /etc/nginx/templates/
COPY --from=build-stage /setsolver-web/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]