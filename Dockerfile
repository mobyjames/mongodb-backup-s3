FROM node:alpine

RUN apt-get update && apt-get -y install cron awscli mongodb-tools

ENV CRON_TIME="0 3 * * *" \
  TZ=US/Eastern \
  CRON_TZ=US/Eastern

ADD run.sh /run.sh
CMD /run.sh
