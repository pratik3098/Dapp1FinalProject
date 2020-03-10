#fabric-ca-server start -b admin.blazers:adminpw 

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/admin.blazers

fabric-ca-client enroll -u http://admin.blazers:adminpw@ca.blazers.com:7054
fabric-ca-client identity modify admin.blazers  --json '{"attrs": [{"name": "hf.Registrar.Roles", "value": "peer,admin,orderer,client,user"}]}'
fabric-ca-client certificate list --id admin.blazers --store msp/admincerts

#fabric-ca-client affiliation add blazers

#Registering identities: 
fabric-ca-client register -d --id.name supplier.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name distributor.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name retailer.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name manufacturer.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name cli.blazers --id.secret adminpw --id.attrs 'hf.Revoker=true,admin=false:ecert'

#Registering Orderer Identity :

fabric-ca-client register -d --id.name orderer.blazers --id.type admin --id.secret ordererpw --id.attrs 'hf.Revoker=true,admin=true:ecert'
fabric-ca-client certificate list --id orderer.blazers --store msp/admincerts
# 6. Enrolling identities
export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/supplier.blazers
fabric-ca-client enroll -u http://supplier.blazers:pw@ca.blazers.com:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/distributor.blazers
fabric-ca-client enroll -u http://distributor.blazers:pw@ca.blazers.com:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/retailer.blazers
fabric-ca-client enroll -u http://retailer.blazers:pw@ca.blazers.com:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/manufacturer.blazers
fabric-ca-client enroll -u http://manufacturer.blazers:pw@ca.blazers.com:7054


export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/orderer.blazers
fabric-ca-client enroll -u http://orderer.blazers:ordererpw@ca.blazers.com:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/cli.blazers
fabric-ca-client enroll -u http://cli.blazers:adminpw@ca.blazers.com:7054


export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/admin.blazers


