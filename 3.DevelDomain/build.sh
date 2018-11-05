#!/bin/sh
#
#Copyright (c) 2014-2018 Oracle and/or its affiliates. All rights reserved.
#
#Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#
# Copying necessary weblogic config files to container-scripts directory
cp -r /home/$USER/projects/therap/suite/apps/server-config container-scripts/
cp /usr/local/Oracle/user_projects/domains/devel/config/config.xml container-scripts/
cp /home/$USER/projects/therap/suite/apps/build/libs/therap-suite.ear container-scripts/ 

# Buidling docker images
docker build -t therap-app:v1 .
