#!/bin/sh

# https://docs.docker.com/engine/install/ubuntu/
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

(
# https://stackoverflow.com/a/18216122/107349
if [ "$(id -u)" -ne "0" ]; then
    echo "Please run as sudo"
    exit 1
fi

apt update -yq
# https://askubuntu.com/a/1013396/11597
apt install -yq apt-transport-https ca-certificates curl
DEBIAN_FRONTEND=noninteractive apt install -yq software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update -yq
apt install -yq docker-ce
    # aufs-tools cgroupfs-mount containerd.io docker-ce docker-ce-cli libltdl7 pigz
adduser aamir docker
systemctl status --no-pager -l docker
)

# Test
# docker run hello-world
# docker run -it alpine
# docker run -it ubuntu
