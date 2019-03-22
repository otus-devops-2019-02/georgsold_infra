#!/bin/bash
echo "Add repo&keys for mongo -> "
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
echo "Update&upgrade and install ruby&mongo --> "
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y ruby-full ruby-bundler build-essential
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
echo "Deploy monolith --->"
git clone -b monolith https://github.com/express42/reddit.git
cd reddit/ && bundle install
puma -d
echo " -> Done!"