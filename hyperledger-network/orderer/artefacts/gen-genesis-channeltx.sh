#1 Generate the Genesis block

#export FABRIC_CFG_PATH=$PWD
GENESIS_FILE=./foodsupply-genesis.block
CHANNEL_NAME=ordererchannel
echo "====> Generating Genesis"
configtxgen -profile FoodSupplyOrdererGenesis -channelID $CHANNEL_NAME -outputBlock $GENESIS_FILE

#2 Generate the commercialpaper channel transaction file
CHANNEL_TX_FILE=./foodsupply-channel.tx
CHANNEL_NAME=foodsupplychannel
echo "====> Generating Channel Tx"
configtxgen -profile FoodSupplyChannel -outputCreateChannelTx $CHANNEL_TX_FILE -channelID $CHANNEL_NAME


