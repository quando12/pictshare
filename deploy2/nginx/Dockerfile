FROM nginx:latest
#COPY web.conf /etc/nginx/sites-enabled/
#RUN rm /etc/nginx/sites-enabled/default

#ssl
COPY ./pictshare.meey.dev.crt /etc/nginx/pictshare.meey.dev.crt
COPY ./pictshare.meey.dev.key /etc/nginx/pictshare.meey.dev.key

ADD web.conf /etc/nginx/conf.d/default.conf

#CMD ["nginx"]

#EXPOSE 80 443
