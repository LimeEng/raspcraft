#!/bin/bash

# Disallow root or sudo
if [[ $(id -u) = 0 ]]; then
   echo "Running as root, exiting"
   exit 1
fi

# Check if server is running
if ! screen -list | grep -q "\.minecraft"; then
  echo "Server is not running"
  exit 1
fi

enter="$(printf \\r)"

# Stop server
echo "Stopping Minecraft server..."
screen -Rd minecraft -X stuff "say Closing server...$(enter)"
screen -Rd minecraft -X stuff "stop$(enter)"

# Wait up to 300 seconds for server to close
echo "Server is closing..."
counter=0
while [ $counter -lt 300 ]; do
  if ! screen -list | grep -q "\.minecraft"; then
    break
  fi
  sleep 5;
  counter=$((counter+1))
  echo "Waited $((counter*5))s..."
done

# Force quit server
if screen -list | grep -q "\.minecraft"; then
  echo "Minecraft server still alive after 300 seconds, forcing shutdown"
  screen -S minecraft -X quit
fi

echo "Minecraft server stopped"
