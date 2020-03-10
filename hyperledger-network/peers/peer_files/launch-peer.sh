#!/bin/bash
peer node status


peer channel fetch 0  -o $ORDERER_ADDRESS -c foodsupplychannel


#2 Join the channel
peer channel join -b $FOODSUPPLY_CHANNEL_BLOCK -o $ORDERER_ADDRESS

#./chain-test.sh install 

