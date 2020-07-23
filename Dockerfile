FROM jermine/nginx
ENV APP_HOME /app
ENV BASE_API="https://jermine.vdo.pub"
MAINTAINER Jermine.hu@qq.com
WORKDIR $APP_HOME
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY . .
## 使用@作为分割符号，避免http链接种的‘/’歧义，虽然可以用‘\’转义但是不够直观，容易因为疏忽造成部署错误
CMD sed -i "s@BASE_API@$BASE_API@g" `grep BASE_API -rl .` ; \
    nginx -g "daemon off;"
