# peer calls need -o and -C flag when using basic network
peer chaincode invoke -n food -c '{"Args":["init_user", "retailer1", "retailer"]}' -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_user", "supplier1", "supplier", "US", "org1"]}' -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_user", "importer1", "importer"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_user", "retailer1", "retailer"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_regulator", "regulator1", "US"]}' -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_product", "product1", "300", "US"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_product", "product2", "350", "US"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["init_product_listing", "productlistingcontract1", "supplier1", "product1", "product2"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["transfer_product_listing", "productlistingcontract1", "importer1"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["read", "productlistingcontract1"]}' -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["check_products", "productlistingcontract1", "regulator1"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["read", "productlistingcontract1"]}' -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["transfer_product_listing", "productlistingcontract1", "retailer1"]}'  -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["read", "productlistingcontract1"]}' -C mychannel -o orderer.example.com:7050
sleep 2
peer chaincode invoke -n food -c '{"Args":["read", "retailer1"]}' -C mychannel -o orderer.example.com:7050
