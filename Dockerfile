<<<<<<< HEAD
FROM node:10-alpine AS compile-image
RUN npm install -g @angular/cli
WORKDIR /app
COPY package.json .
RUN npm install
ENV PATH="./node_modules/.bin:$PATH" 
COPY . .
RUN ng build --prod

FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=compile-image /app/dist/client /usr/share/nginx/html
EXPOSE 80
=======
FROM nginx:alpine
RUN apk add openssl
RUN rm -rf /usr/share/nginx/html/*
COPY ./dist/client /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
>>>>>>> aed3f08b72e80e41524301d39fe88040492a8a76
