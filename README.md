# docker-containers
Free Generalized Docker Containers for Developer Operations Workflows. Check back routinely for new containers.

## docker-fedora-centos
This repo contains everything needed to launch a virtual development environment for web-based 
services that are being deployed from a Fedora Workstation -> CENTOS server. 

> The Repository has two standard branches
>> Master 
>> Develop

### fedora-centos-base
Contains init.sh which gets docker & tools running on the developers fedora workstation. 

#### fedora-centos-base install verification screenshots

##### 1
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/1.png)
##### 2
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/2.png)
##### 3
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/3.png)
##### 4
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/4.png)
##### 5
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/5.png)
##### 6
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/6.png)
##### 7
![installing docker & the fedora-centos-base container](fedora-centos-base/setuo_images/7.png)

### centos-lamp
This is a general CLAMP web-server container... To use this enter the following command
from the cento-os directory

`$ docker-compose up -d`

Also ensure to change /websites/:/var/www/html to whatever your local directory structure is.

#### centos-lamp install verification screenshots

![installing the centos-lamp container](centos-lamp/setuo_images/1-installing.png)
