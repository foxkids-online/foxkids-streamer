FROM alpine:latest

RUN apk add --no-cache ffmpeg
RUN apk add --no-cache curl

COPY crontab /tmp/crontab
RUN cat /tmp/crontab > /etc/crontabs/root
CMD ["crond", "-f", "-l", "2"]