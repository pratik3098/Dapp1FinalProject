#!/bin/bash

peer channel create -o $ORDERER_ADDRESS -c foodsupplychannel -f $CHANNEL_TX_FILE

./launch-peer.sh
