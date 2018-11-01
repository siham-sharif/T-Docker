#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run:
#      $ docker build -t devel-domain:v1 .
#
# Pull base image
# ---------------
FROM oracle/weblogic:12.2.1.2-generic

# Maintainer
# ----------
MAINTAINER Siham Sharif <siham.sharif@gmail.com>

# WLS Configuration && Domain and Server environment variables
# ---------------------------
ENV USER_MEM_ARGS="-Djava.security.egd=file:/dev/./urandom" \
    CONFIG_JVM_ARGS="-Dweblogic.security.SSL.ignoreHostnameVerification=true" \
    DOMAIN_NAME="devel" \
    ADMIN_PORT="7001" \
    SSL_SECURE_PORT="7002" \
	# THIS IS FOR FUTURE SCALE UP \
    NM_PORT="5556" \
    MS_PORT="8001" \
    DEBUG_PORT="8453"

# Adding basicDomain files to create domain
# COPY --chown=<user>:<group> <hostPath> <containerPath>
# COPY --chown=oracle container-scripts/basicDomain.py /usr/local/Oracle/installerFiles/
# does not work : https://github.com/oracle/docker-images/issues/986
COPY container-scripts/basicDomain.py /usr/local/Oracle/installerFiles/

USER root
RUN chown oracle:oracle /usr/local/Oracle/installerFiles/basicDomain.py

# Creating Domain with basicDomain.py and removing it later
USER oracle

RUN wlst.sh /usr/local/Oracle/installerFiles/basicDomain.py && \
    rm -rf /usr/local/Oracle/installerFiles/basicDomain.py

# Expose Node Manager default port, and also default for admin and managed server
# Works also with -p (publish) parameter
# EXPOSE should be used for inter container connection 
# https://stackoverflow.com/questions/22111060/what-is-the-difference-between-expose-and-publish-in-docker?answertab=active#tab-top
# EXPOSE $ADMIN_PORT $SSL_SECURE_PORT $NM_PORT $MS_PORT $DEBUG_PORT

# Working directory for oracle
WORKDIR /usr/local/Oracle
