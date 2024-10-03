# 빌드 스테이지
FROM alpine:3.14 AS build

# 필요한 패키지 설치 및 Tomcat 다운로드
RUN apk add --no-cache wget tar openjdk8-jre-base && \
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz -O /tmp/apache-tomcat.tar.gz && \
    mkdir -p /usr/local/tomcat && \
    tar -xzf /tmp/apache-tomcat.tar.gz -C /usr/local/tomcat --strip-components=1 && \
    rm /tmp/apache-tomcat.tar.gz && \
    wget https://github.com/ran-jit/tomcat-cluster-redis-session-manager/releases/download/2.0.4/tomcat-cluster-redis-session-manager.zip && \
    unzip tomcat-cluster-redis-session-manager.zip && \
    cp tomcat-cluster-redis-session-manager/lib/* /usr/local/tomcat/lib/ && \
    cp tomcat-cluster-redis-session-manager/conf/* /usr/local/tomcat/conf/ && \
    rm tomcat-cluster-redis-session-manager.zip && \
    rm -rf tomcat-cluster-redis-session-manager

# 최종 이미지 스테이지
FROM alpine:3.14

# 필요한 패키지 설치
RUN apk add --no-cache openjdk8-jre-base && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone && \
    apk del --purge tzdata && \
    rm -rf /var/cache/apk/*

# Tomcat 복사
COPY --from=build /usr/local/tomcat /usr/local/tomcat

# MariaDB JDBC 드라이버 복사
COPY mariadb-java-client-3.4.1.jar /usr/local/tomcat/lib
COPY redis-data-cache.properties /usr/local/tomcat/conf/
COPY web2.xml /usr/local/tomcat/conf/web.xml
COPY web.xml /usr/local/tomcat/webapps/ROOT/web.xml
COPY context.xml /usr/local/tomcat/conf/
COPY css /usr/local/tomcat/webapps/ROOT/css/
COPY fonts /usr/local/tomcat/webapps/ROOT/fonts/
COPY images /usr/local/tomcat/webapps/ROOT/images/
COPY js /usr/local/tomcat/webapps/ROOT/js/
COPY META-INF /usr/local/tomcat/webapps/ROOT/META-INF/
COPY WEB-INF /usr/local/tomcat/webapps/ROOT/WEB-INF/
COPY index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp
RUN rm -rf /usr/local/tomcat/webapps/ROOT/index.html

# Tomcat 포트 노출
EXPOSE 8080

# Tomcat 실행
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]