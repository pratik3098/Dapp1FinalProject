# Create the commercialpaper channel
export CHANNEL_TX_FILE=./foodsupply-channel.tx

# Execute the channel create command
peer channel create -o "localhost:7050" -c foodsupplychannel -f $CHANNEL_TX_FILE
