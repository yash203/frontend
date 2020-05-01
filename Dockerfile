FROM node:alpine as basebuilder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=basebuilder /usr/app/build /usr/share/nginx/html

