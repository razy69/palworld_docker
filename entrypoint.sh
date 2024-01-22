#!/bin/sh

echo "-- Starting Palworld --"
cd /opt/palworld || exit 1
./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
