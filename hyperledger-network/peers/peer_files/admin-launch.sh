#!/bin/bash

#peer channel create -o $ORDERER_ADDRESS -c foodsupplychannel -f $CHANNEL_TX_FILE
#sleep 3
rm -rf $FOODSUPPLY_CHANNEL_BLOCK_0
rm -rf $FOODSUPPLY_CHANNEL_BLOCK
peer node status


peer channel fetch 0  -o $ORDERER_ADDRESS -c foodsupplychannel

sleep 3
#2 Join the channel
#peer channel join -b $FOODSUPPLY_CHANNEL_BLOCK_0 -o $ORDERER_ADDRESS
#sleep 3 

#./chain-test.sh install 


#./chain-test.sh instantiate

