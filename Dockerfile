FROM node:alpine as builde

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builde /app/build /usr/share/nginx/html
