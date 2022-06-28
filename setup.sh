#!/bin/bash

# Installing programs
sudo apt update
sudo apt install screen -y
sudo apt install curl -y
sudo apt install ufw -y
sudo apt install openjdk-17-jre-headless -y

# Firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 25565/tcp
sudo ufw allow 22
sudo ufw --force enable
