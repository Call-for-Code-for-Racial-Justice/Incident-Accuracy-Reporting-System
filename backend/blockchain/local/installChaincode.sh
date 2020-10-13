#!/bin/bash
set -ex
LANGUAGE=${1:-"golang"}

export CONTRACT_PATH='/Users/laurabennett/2020/EMBRACE-Challenge'

echo "Copying Chaincode to cli container"
docker cp ${CONTRACT_PATH}/Blockchain-for-maintaining-Digital-Assets/contract/ cli:/opt/gopath/src/github.com/asset

echo "Install and Instantiate Chaincode"
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" cli peer chaincode install -n asset -v 1.0 -p /opt/gopath/src/github.com/asset -l node
sleep 5
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" cli peer chaincode instantiate  -l node -o orderer.example.com:7050 -C mychannel -n asset -v 1.0 -c '{"Args":[]}' -P 'OR ("Org1MSP.member")'
echo "Chaincode Instantiated"
sleep 10
echo "Test Chaincode"
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" cli peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n asset -c '{"Args":["queryAllDigitalAssets"]}'