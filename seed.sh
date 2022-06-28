#!/bin/bash

# Download scripts from github and execute them
curl https://raw.githubusercontent.com/LimeEng/raspcraft/master/seed.sh --output seed.sh
curl https://raw.githubusercontent.com/LimeEng/raspcraft/master/setup.sh --output setup.sh
curl https://raw.githubusercontent.com/LimeEng/raspcraft/master/start.sh --output start.sh
curl https://raw.githubusercontent.com/LimeEng/raspcraft/master/stop.sh --output stop.sh
curl https://raw.githubusercontent.com/LimeEng/raspcraft/master/minecraft.service --output minecraft.service
