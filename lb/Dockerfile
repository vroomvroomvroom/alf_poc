FROM nginx
MAINTAINER https://github.com/vroomvroomvroom

RUN apt-get update && \
    apt-get install -y curl vim

WORKDIR cd /usr/local/bin

#copy up needed config
COPY nginx.conf /etc/nginx/nginx.conf

# test the copied config
#RUN /usr/sbin/nginx -t
#reload conf
#RUN /usr/sbin/service nginx reload


