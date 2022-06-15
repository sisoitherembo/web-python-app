FROM nginx:1.21

RUN mkdir -p /var/www/static/

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
ADD static/ /var/www/static/