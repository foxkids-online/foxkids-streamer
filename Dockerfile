FROM alpine:latest

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg
RUN apt-get -y install curl

COPY crontab /tmp/crontab
RUN cat /tmp/crontab > /etc/crontabs/root
CMD ["crond", "-f", "-l", "2"]