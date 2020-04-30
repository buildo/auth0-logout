FROM nginx

ADD entrypoint.sh /
ADD nginx.conf.template .

ENV COOKIE_NAME _forward_auth

ENTRYPOINT [ "/entrypoint.sh" ]
