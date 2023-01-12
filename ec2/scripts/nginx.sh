#! /bin/bash

# install nginx
sudo apt-get update

sudo apt-get install nginx -y

# make sure nginx is started
sudo systemctl enable nginx.service
sudo systemctl start nginx.service

sudo shutdown -r now