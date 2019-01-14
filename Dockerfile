FROM nginx:latest

ADD nginx.conf /home/
RUN mkdir -p /home/bin
ADD docker-entrypoint.sh /home/bin/
WORKDIR /home
RUN chmod -R 700 ./bin

ENTRYPOINT /home/bin/docker-entrypoint.sh
