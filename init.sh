#!/bin/bash
#this script will do everything needed to get the docker renderlogic developer container installed and running.
#this shell script was authored by john@renderlogic.com - feel free to contact me for questions and suggestions.

#global constants / variables
FEDORA_DOCKER_REPO='https://download.docker.com/linux/fedora/docker-ce.repo'
COMPOSE_VERSION='1.28.2'

#colors
GREENFONT='\033[0;32m'
REDFONT='\033[0;31m'
NC='\033[0m' # No Color

# first remove all old docker instances and install latest docker version following the docker for fedora guideline found 
# here : https://docs.docker.com/engine/install/fedora/
sudo echo "Updating System..."
sudo dnf -y update
sudo echo "Checking for and removing previous non-compatible docker installations... "
sudo dnf -y remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
echo "Adding DNF Plugins Core..."
sudo dnf -y install dnf-plugins-core
echo "Installing Docker's Fedora Repository..."
sudo dnf config-manager --add-repo $FEDORA_DOCKER_REPO
echo "Enable Fedora Docker CE Nightly Build Repository? (yes/no)" 
read user_answer
if [[ $user_answer -eq 'yes' ]]; then
	sudo dnf config-manager --set-enabled docker-ce-nightly
	echo -e "${GREENFONT}Docker CE Nightly Enabled!${NC}"
fi
echo "Enable Fedora Docker CE Test Build Repository? (yes/no)" 
read user_answer
if [[ $user_answer -eq 'yes' ]]; then
	sudo dnf config-manager --set-enabled docker-ce-test
	echo -e "${GREENFONT}Docker CE Test Enabled!${NC}"
fi

#install LATEST docker engine
sudo dnf -y install docker-ce docker-ce-cli containerd.io
echo "Starting Docker and Running Docker Hello World Container Test..."
sudo systemctl start docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo docker run hello-world
sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo mkdir c7-systemd-base
sudo touch c7-systemd-base/Dockerfile >> 
"
FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
"
sudo docker build --rm -t c7-systemd-base .