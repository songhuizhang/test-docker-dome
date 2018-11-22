# 使用node版本 8.12.0
FROM node:8.12.0

RUN yum update \
    && yum install -y nginx

WORKDIR /app

COPY . /app/

EXPOSE 80

RUN npm install \
    && npm run build \
    && cp -r dist/* /var/www/html \
    && rm -rf /aa

CMD ["nginx","-g","daemon off;"]
