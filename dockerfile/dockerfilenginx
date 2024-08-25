FROM nginx:1.14-alpine

ENV TZ=Asia/Seoul

COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.jsp /usr/share/nginx/html/index.jsp
RUN rm -rf /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

