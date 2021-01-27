FROM ubuntu:16.04

ENV MONGO_MAJOR 4.0
ENV MONGO_VERSION 4.0.0

RUN apt-get update && apt-get upgrade -y && apt-get install lsb-release wget -y

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E52529D4 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/$MONGO_MAJOR multiverse" | tee /etc/apt/sources.list.d/mongodb-org-$MONGO_MAJOR.list && \
    apt-get update && \
    apt-get install mongodb-org-shell=$MONGO_VERSION mongodb-org-tools=$MONGO_VERSION
    
RUN apt-get update && apt-get -y install cron s3cmd

ENV CRON_TIME="0 3 * * *" \
  TZ=US/Eastern \
  CRON_TZ=US/Eastern

ADD run.sh /run.sh
CMD /run.sh
