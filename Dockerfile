FROM nginx:latest

ADD nginx.conf /home/
RUN mkdir -p /home/bin
ADD bin /home/bin
WORKDIR /home
RUN chmod -R 700 ./bin

ENTRYPOINT /home/bin/docker-entrypoint.sh
