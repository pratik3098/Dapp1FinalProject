1. docker-compose -f fabric-ca.yaml up -d

2. fabric-ca-server start -b admin.blazers:adminpw 

3. export FABRIC_CA_CLIENT_HOME=$HOME/fabric-ca/clients/admin.blazers
  fabric-ca-client enroll -u http://admin.blazers:adminpw@localhost:7054

  fabric-ca-client identity modify admin.blazers  --json {"attrs": [{"name": "hf.Registrar.Roles", "value": "peer,admin,orderer,client"}]}

4. Adding Affiliation
fabric-ca-client affiliation add blazers

5.Registering identities: 
fabric-ca-client register -d --id.name supplier.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name distributor.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name retailer.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name manufactuer.blazers --id.secret pw --id.attrs 'hf.Revoker=true,admin=false:ecert'

fabric-ca-client register -d --id.name cli.blazers --id.secret adminpw --id.attrs 'hf.Revoker=true,admin=true:ecert'

Registering Orderer Identity :

fabric-ca-client register -d --id.name orderer.blazers --id.type orderer --id.secret ordererpw --id.attrs 'hf.Revoker=true,admin=true:ecert'

6. Enrolling identities
export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/supplier.blazers
fabric-ca-client enroll -u http://supplier.blazers:pw@localhost:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/distributor.blazers
fabric-ca-client enroll -u http://distributor.blazers:pw@localhost:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/retailer.blazers
fabric-ca-client enroll -u http://retailer.blazers:pw@localhost:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/manufacturer.blazers
fabric-ca-client enroll -u http://manufacturer.blazers:pw@localhost:7054


export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/orderer.blazers
fabric-ca-client enroll -u http://orderer.blazers:ordererpw@localhost:7054

export FABRIC_CA_CLIENT_HOME=/etc/hyperledger/fabric-ca-client/cli.blazers
fabric-ca-client enroll -u http://orderer.blazers:ordererpw@localhost:7054




