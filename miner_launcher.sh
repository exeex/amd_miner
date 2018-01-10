#!/bin/bash
DEFAULT_DELAY=0
if [ "x$1" = "x" -o "x$1" = "xnone" ]; then
   DELAY=$DEFAULT_DELAY
else
   DELAY=$1
fi
sleep $DELAY

sudo /home/min2/amdgpu-pro-fans/amdgpu-pro-fans.sh -s 60
cd /home/min2/miner
su min2 -c "screen -dmS ethm ./start.bash"

#sudo /home/min2/amdgpu-pro-fans/amdgpu-pro-fans.sh -s 60
