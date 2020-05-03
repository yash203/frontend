FROM node:alpine as basebuilder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=basebuilder /app/build /usr/share/nginx/html

