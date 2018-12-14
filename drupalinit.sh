#!/usr/bin/env bash

#This script is written complete installation of drupal using drush

# fail the script if any command fails
set -e

sleep 10
CONTAINER_ID=$(docker ps|grep web|awk '{print $1}')
docker exec -it $CONTAINER_ID drush site-install --db-url=mysql://drupalusr:password@db:3306/drupal -y
docker exec -it $CONTAINER_ID chmod 777 -R /var/www/html/sites/
docker exec -it $CONTAINER_ID sed -i '123s/#//g' /var/www/html/.htaccess
docker exec -it $CONTAINER_ID drush cr
