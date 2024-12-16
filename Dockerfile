FROM alpine:latest

RUN apk -y update
RUN apk -y upgrade
RUN apk --no-cache install -y ffmpeg
RUN apk --no-cache -y install curl

COPY crontab /tmp/crontab
RUN cat /tmp/crontab > /etc/crontabs/root
CMD ["crond", "-f", "-l", "2"]