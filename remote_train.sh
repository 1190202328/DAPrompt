#!/bin/bash

bash /nfs/volume-902-16/tangwenbo/ofs-1.sh

cd /nfs/ofs-902-1/object-detection/jiangjing/experiments/DAPrompt && bash scripts/main.sh $1 $2 $3 $4 $5 $6
