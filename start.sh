#!/bin/bash

# Disallow root or sudo
if [[ $(id -u) = 0 ]]; then
   echo "Running as root, exiting"
   exit 1
fi

# Check if server is running
if screen -list | grep -q "\.minecraft"; then
    echo "Server is already running"
    echo "Open console with \"screen -r minecraft\""
    exit 1
fi

cd server
screen -dmS minecraft java -Xms400M -Xmx6G server.jar nogui
echo "Server starting"
