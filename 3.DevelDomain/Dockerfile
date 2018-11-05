#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run:
#      $ docker build -t devel-domain:v1 .
#
# Pull base image
# ---------------
FROM devel-domain:basic

# Maintainer
# ----------
MAINTAINER Siham Sharif <siham.sharif@gmail.com>

# WLS Configuration && Domain and Server environment variables
# ---------------------------
ENV DOMAIN_HOME=/usr/local/Oracle/user_projects/domains/devel \
    ADMIN_PORT=7001 \
    SSL_SECURE_PORT=7002 \
    DB_PORT=1521

# Adding config files to customize therap domain
# COPY --chown=<user>:<group> <hostPath> <containerPath>
# COPY --chown=oracle container-scripts/basicDomain.py /usr/local/Oracle/installerFiles/
# does not work : https://github.com/oracle/docker-images/issues/986
# Copying log jdbc jms ojdbc coherence directory
COPY container-scripts/server-config/dev/log $DOMAIN_HOME/config/log
COPY container-scripts/server-config/dev/jdbc $DOMAIN_HOME/config/jdbc
COPY container-scripts/server-config/dev/jms $DOMAIN_HOME/config/jms
COPY container-scripts/server-config/prod/config/ojdbc $DOMAIN_HOME/config/ojdbc
COPY container-scripts/server-config/prod/config/coherence $DOMAIN_HOME/config/coherence

# Copying app-host config.xml therap-suite.ear
COPY container-scripts/server-config/dev/app-host.properties $DOMAIN_HOME/config/
COPY container-scripts/config.xml $DOMAIN_HOME/config/
COPY container-scripts/customSetDomain.txt $DOMAIN_HOME/config/
COPY container-scripts/therap-suite.ear $DOMAIN_HOME/config/

USER root
RUN chown oracle:oracle -R $DOMAIN_HOME/config/ && \
    sed -i "/export WL_HOME/ r $DOMAIN_HOME/config/customSetDomain.txt" $DOMAIN_HOME/bin/setDomainEnv.sh && \
    sed -i 's@{AES}uvvr81JCgJlqK5DuvaxCy0ADZ0VbQST3kSd5U7S7tp0atZF6I7YrHU9WWKeiJKX+1YY/2wlldpb9erZju0fJ0or83W7rNvy43pTOWZZFMuc1LFjn//qCsHyJtKfMNRuB@{AES}X9J/gtgt82CBnn+LjFj4INLlwfzU6W5moZNTFf/ShJDSznB+rTsLBv5KvAkB1mOJM8RH/Vr/UnEdkAIX8XUZLgxBOX5hg9bMMx8fz2Rw9ddgcNUWODjpLluUBGeY0bJj@g' $DOMAIN_HOME/config/config.xml && \
    sed -i 's@{AES}T9wGkpfuf0bUI5PpGOrvF96TwsFqwFRW8s88F/y3qbQ=@{AES}mUwqER44gyqSUM15NmGdGNA9RgRDLmouhTzgKPzHxkY=@g' $DOMAIN_HOME/config/config.xml && \
    sed -i 's@{AES}sWoYYh42qtuJ6DntdkytoQkI/fjUuTjvwZKlGhZHJm80hp0UQ9fsSGM4MoYETF02@{AES}HdOSj3/fzZLq2kaSRMfifgsqh3rcO0FAzJbeoryBw8re1TzamExzVJI0PA/G+20I@g' $DOMAIN_HOME/config/config.xml && \
    sed -i 's@/usr/local/projects/therap/suite/apps/build/libs@/usr/local/Oracle/user_projects/domains/devel/config@g' $DOMAIN_HOME/config/config.xml


# Expose Node Manager default port, and also default for admin and managed server
# Works also with -p (publish) parameter
# EXPOSE should be used for inter container connection 
# https://stackoverflow.com/questions/22111060/what-is-the-difference-between-expose-and-publish-in-docker?answertab=active#tab-top
 EXPOSE $ADMIN_PORT $SSL_SECURE_PORT $DB_PORT

# Switching to oracle user
USER oracle

# Working directory for oracle
WORKDIR /usr/local/Oracle

CMD nohup ./usr/local/Oracle/user_projects/domains/devel/startWebLogic.sh &
