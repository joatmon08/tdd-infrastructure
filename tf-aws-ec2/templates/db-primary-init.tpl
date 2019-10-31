#!/bin/bash -
sudo apt-get -y install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

i=1
while [ $i -ne 0 ]
do
  sudo grep 'waiting for connections on port 27017' /var/log/mongodb/mongod.log
  i=$?
done