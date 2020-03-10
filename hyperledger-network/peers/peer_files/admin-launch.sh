#!/bin/bash

peer channel create -o $ORDERER_ADDRESS -c foodsupplychannel -f $CHANNEL_TX_FILE

peer node status


peer channel fetch 0  -o $ORDERER_ADDRESS -c foodsupplychannel


#2 Join the channel
peer channel join -b $FOODSUPPLY_CHANNEL_BLOCK_0 -o $ORDERER_ADDRESS

sleep 3 

#./chain-test.sh install 


#./chain-test.sh instantiate

