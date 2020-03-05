#!/bin/bash
peer node status

export CHANNEL_TX_FILE=./foodsupply-channel.tx

# Execute the channel create command
peer channel create -o $ORDERER_ADDRESS -c foodsupplychannel -f $CHANNEL_TX_FILE

rm -f foodsupplychannel_0.block
rm -f foodsupplychannel.block

export FOODSUPPLY_CHANNEL_BLOCK_0=./commercialpaperchannel_0.block

peer channel fetch 0  -o $ORDERER_ADDRESS -c foodsupplychannel

#2 Join the channel
peer channel join -b $FOODSUPPLY_CHANNEL_BLOCK_0 -o $ORDERER_ADDRESS

#./chain-test.sh install 


#./chain-test.sh instantiate