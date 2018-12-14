#DRUPAL 8+Docker Compose+Ubuntu 16.04 LTS+LAMP+Drush+Travis

Please use https://travis-ci.org to run.

I have attached the travis job run logs for reference. (travisjob.log)

## Test steps in local machine(preferred Linux or Mac)

1)Install git, docker , docker-compose ,curl(if you don't have Browser) in your test machine

2)Clone the code to test machine
  **git clone https://github.com/chathra222/drupalsite.git**

3)Run **docker-compose build** from the root folder of the project to build docker images

4)Run **docker-compose up -d** to bring up the docker containers

5)Run **docker-compose ps** to verify the docker containers

6)Run **drupalinit.sh**  script to run Drupal installation using Drush

7)Access to Drupal site http://localhost:8080  from browser or using curl
