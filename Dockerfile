FROM nginx:alpine
RUN apk add openssl
RUN rm -rf /usr/share/nginx/html/*
COPY ./dist/client /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
