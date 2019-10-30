#!/bin/bash
install_dir="/usr/local/bin"
cd $install_dir
sudo apt-get -y update
sudo apt -y install default-jre
sudo apt-get -y install git
sudo git clone https://github.com/ThoughtWorksInc/voter-service.git
cd voter-service
sudo git checkout artifacts
binary_name=`ls`

echo "[Unit]
Description=Voter Service
After=network.target
Documentation=https://github.com/ThoughtWorksInc/voter-service

[Service]
User=ubuntu
Group=ubuntu
ExecStart=/usr/bin/java -jar $install_dir/voter-service/$binary_name \
--spring.profiles.active=aws-production \
--spring.data.mongodb.host=${mongo_host_address}

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/voter.service

sudo service voter start
