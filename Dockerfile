FROM nginx

ADD entrypoint.sh /
ADD nginx.conf.template .

ENV COOKIE_NAME _forward_auth
ENV CSRF_COOKIE_NAME _forward_auth_csrf

ENTRYPOINT [ "/entrypoint.sh" ]
