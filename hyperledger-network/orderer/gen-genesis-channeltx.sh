#!/bin/bash

rm -f ./artefacts/*
#1 Generate the Genesis block
GENESIS_FILE=./artefacts/foodsupply-genesis.block
CHANNEL_NAME=ordererchannel
echo "====> Generating Genesis <====" 
configtxgen -profile FoodSupplyOrdererGenesis -channelID $CHANNEL_NAME -outputBlock $GENESIS_FILE

#2 Generate the commercialpaper channel transaction file
CHANNEL_TX_FILE=./artefacts/foodsupply-channel.tx
CHANNEL_NAME=foodsupplychannel
echo "====> Generating Channel Tx <===="
configtxgen -profile FoodSupplyChannel -outputCreateChannelTx $CHANNEL_TX_FILE -channelID $CHANNEL_NAME


cp -f ./artefacts/foodsupply-channel.tx ../peers/peer_files


