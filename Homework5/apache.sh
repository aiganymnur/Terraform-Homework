#!/bin/bash


sudo apt install apache2 -y
apt update -y
sudo systemctl start apache2
sudo systemctl enable httpd
