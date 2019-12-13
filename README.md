# ZeroDownTime-Deployment-Moodle
This repository contain the files for the deployment of Moodle service without down time

Download the repository by using the command line or clone from the git interface

$ curl -sSL https://github.com/michiel65/ZeroDownTime-Deployment-Moodle.git

run de deployment.sh script by using the command line 

$ ./deployment.sh

the moodle image is based on the binami image then you can edit the Dockerfile according to the bitnami moodle image avilable here:

https://github.com/bitnami/bitnami-docker-moodle

After the deployment, you can acces to the Moodle service by using http://localhost/ from the browser. 

The traefik dashboard will be available at http://localhost:8080
