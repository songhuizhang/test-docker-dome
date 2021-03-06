# 使用node版本 8.12.0
FROM node:8.12.0

RUN apt-get update \
    && apt-get install -y nginx

WORKDIR /app

COPY . /app/

EXPOSE 80

RUN npm install \
    && npm run build \
    && cp -r build/* /var/www/html \
    && rm -rf /aa

CMD ["nginx","-g","daemon off;"]
