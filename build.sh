#! /bin/bash
#
# build the image and submit it to docker hub
#

TIMESTAMP=`date +%Y-%m-%d`
sed -i "s/ENV REFRESHED_AT .*$/ENV REFRESHED_AT $TIMESTAMP/" Dockerfile
sudo docker build -t diegocortassa/postfix-forwarding .
sudo docker build -t diegocortassa/postfix-forwarding:1.0 .

sudo docker push diegocortassa/postfix-forwarding
sudo docker push diegocortassa/postfix-forwarding:1.0

