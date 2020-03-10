function    usage {
    echo  "Usage: ./chain-test.sh    install | instantiate | invoke | query "
    echo  "Utility for testing peer/channel setup with chaincode"
}
#source ./set-env.sh
# Uses the core.yaml file in current folder - copy of core.yaml under cloud/bins/peer
if [ -z $1 ];
then
    usage
    echo  "Please specify Operation!!!"
    exit 0
else
  
    OPERATION=$1
fi


# Test Chaincode related properties
# Change these if you would like to try out your own chaincode
export CC_CONSTRUCTOR='{"Args":["instantiate"]}'
export CC_NAME="foodsupply"
export CC_PATH="/opt/gopath/src/github.com/hyperledger/fabric/peer/contract_files/chaincode"
export CC_VERSION="1.0"
export CC_CHANNEL_ID="foodsupplychannel"

echo "CC Operation : $OPERATION    for   Org: $PEER_ORG"

# Invoke the "peer chain code" command using the operation
case $OPERATION in
    "install")   
              peer chaincode install  -n $CC_NAME -p $CC_PATH -v $CC_VERSION -l node

              peer chaincode list --installed -C $CC_CHANNEL_ID
        ;;
    "instantiate")
              peer chaincode instantiate -C $CC_CHANNEL_ID -n $CC_NAME  -v $CC_VERSION -c $CC_CONSTRUCTOR  -o $ORDERER_ADDRESS

              #peer chaincode list --instantiated -C $CC_CHANNEL_ID
        ;;
    "query")
            echo -n "Paper 001="
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["query","Magnetocorp","001"]}'
            sleep 3
            echo -n "Paper 002="
            peer chaincode query -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["query","Magnetocorp","002"]}'
        ;;
    
    "invoke")
            
            echo "Invoke issue transcation  from Magnetocorp"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["issue","Magnetocorp","001","05-04-2019","05-09-2019","5M"]}'
            
            echo "Invoke issue transcation  from Magnetocorp"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["issue","Magnetocorp","002","06-04-2019","10-10-2019","7M"]}'

            sleep 3
            echo "Invoke buy transcation  from Magnetocorp=>Digibank"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["buy","Magnetocorp","001","Magnetocorp","Digibank", "100000", "27-09-2019"]}'

        
            sleep 3
            echo "Invoke redeem transcation  from Magnetocorp"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["redeem","Magnetocorp","001","Digibank","12-08-2019"]}'
           

           
        ;;
    "clear")
            echo "Cleaning up Chaincode Docker images"
            docker rmi -f $(docker images -q | grep dev-)
        ;;
    *) usage
        ;;
esac


