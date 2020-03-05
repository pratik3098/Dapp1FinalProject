#!/bin/bash
rm -f ./foodsupplychannel_0.block
rm -f ./foodsupplychannel.block
peer channel fetch 0  -o $ORDERER_ADDRESS -c foodsupplychannel

# Join the channel
peer channel join -b $FOODSUPPLY_CHANNEL_BLOCK_0 -o $ORDERER_ADDRESS

