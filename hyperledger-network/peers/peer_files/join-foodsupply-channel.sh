
#source ./set-env.sh
rm -f foodsupplychannel_0.block
rm -f foodsupplychannel.block
export FOODSUPPLY_CHANNEL_BLOCK_0=./foodsupplychannel_0.block

peer channel fetch 0  -o $ORDERER_ADDRESS -c foodsupplychannel

#1 Join the channel
peer channel join -b $FOODSUPPLY_CHANNEL_BLOCK_0 -o "localhost:7050"

