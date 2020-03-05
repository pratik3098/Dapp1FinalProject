#!/bin/bash
export CHANNEL_TX_FILE=./foodsupply-channel.tx

peer channel create -o $ORDERER_ADDRESS -c foodsupplychannel -f $CHANNEL_TX_FILE

./launch-peer.sh
