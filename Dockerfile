FROM alpine

MAINTAINER Jerry Dempsey jerry@stylee.org

RUN apk add --no-cache curl

RUN mkdir /caddy \
&& curl -sL -o /caddy/caddy.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=http.git,http.hugo&license=personal" \
&& tar -xf /caddy/caddy.tar.gz -C /caddy \
&& mv /caddy/caddy /usr/bin/caddy \
&& chmod 755 /usr/bin/caddy \
&& rm -rf /caddy

ADD Caddyfile /

EXPOSE 2015
EXPOSE 443
EXPOSE 80

VOLUME /var/www

WORKDIR /var/www
CMD /usr/bin/caddy --conf /Caddyfile
