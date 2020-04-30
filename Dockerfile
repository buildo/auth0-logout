FROM nginx:alpine

ADD nginx.conf.template .

ENV COOKIE_NAME _forward_auth

CMD /bin/sh -c "envsubst < ./nginx.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
