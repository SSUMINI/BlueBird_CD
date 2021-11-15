#! /bin/bash
TAG_NAME=$(wget -q https://registry.hub.docker.com/v1/repositories/sms0430/bluebird/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}' | tail -1)

echo $TAG_NAME

sed -i "22s/bluebird.*$/bluebird:$TAG_NAME/g" deploy.yaml

exit 0
