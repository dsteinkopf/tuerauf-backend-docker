FROM tomcat:7.0-jre8

MAINTAINER Dirk Steinkopf "https://github.com/dsteinkopf"

ENV BRANCH_NAME=master
ENV DOWNLOAD_URL=https://tuerauf.dirkness.de/tuerauf-backend-java/tuerauf-$BRANCH_NAME.war

COPY setenv.sh $CATALINA_HOME/bin/

VOLUME $CATALINA_HOME/conf

RUN set -x \
    && curl "$DOWNLOAD_URL" --output $CATALINA_HOME/webapps/tuerauf.war \
    && touch $CATALINA_HOME/webapps/tuerauf.war

#see tomcat: EXPOSE 8080
#see tomcat: WORKDIR $CATALINA_HOME

USER daemon:daemon

CMD ["catalina.sh", "run"]
