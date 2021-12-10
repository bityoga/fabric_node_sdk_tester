# Hyperledger Fabric NodeSDK Tester
Node sdk test examples to interact with bityoga fabric set up

# Requirements
  1. Bityoga fabric sdk should be up and running
  2. Node version
     - Supports node version >=8
     - Tested with v8.9.0

# Run Instructions
  1. ## Clone this repository
      ```git clone https://github.com/bityoga/fabric_node_sdk_tester.git```
      
  2. ## Run npm install
      - cd fabric_node_sdk_tester
      - **Set node version:** ```nvm use node v8.9.0``` (using nvm)
      - ```npm install```
      
  3. ## Update ip address in 'network_profile.json'
      - update the url ip addresses of orderer, peer2, orgca, tlsca (4 places).
      - update it with your prime manager's ip address
      
  4.  ## Retrieve hyperledger fabric tls certificates of 'orderer' and 'peer2'
      #### (Replace ip address with your fabric prime manager's ip address)

        ```
        scp -r root@LOCALHOST_OR_YOUR_MASTER_MACHINE_IP_ADDRESS:/root/hlft-store/tlsca/orderer/tls-msp/tlscacerts/tls-tlsca-7054.pem ./hlft-store/tlsca/orderer/tls-msp/tlscacerts/tls-tlsca-7054.pem
        ```

        ```
        scp -r root@LOCALHOST_OR_YOUR_MASTER_MACHINE_IP_ADDRESS:/root/hlft-store/tlsca/peer2/tls-msp/tlscacerts/tls-tlsca-7054.pem ./hlft-store/tlsca/peer2/tls-msp/tlscacerts/tls-tlsca-7054.pem
        ```
        
       #### (or)
        
        **run shell script:** ```bash get_tls_certificates.sh```
        
   5. ## Enroll admin
        #### Command : ```node enrollAdmin.js```
        - check wallet directory
        - a directory named 'admin' will be available.
        - certificates for admin will be available under this directory.

   6. ## Register user
        #### If needed, edit the following lines in registerUser.js
        ```js
        const user_name = "lion";
        const user_password = "lion";
        const user_role = "client";
        ```
        #### Command : ```node registerUser.js```
        - check wallet directory
        - a directory with the name of the 'registerd user name' will be available
        - certificates for the registerd user  will be available under this directory.
    
   7. ## Query a chaincode
        #### If needed, edit the following lines in query.js
        ```js
          const user_name = "lion";
          const CHANNEL_NAME  = "appchannel";
          const CHAIN_CODE_NAME = "carcc";
          const CHAIN_CODE_FUNCTION_NAME = "listCars";
          const result = await contract.evaluateTransaction(CHAIN_CODE_FUNCTION_NAME);
          const result = await contract.evaluateTransaction(CHAIN_CODE_FUNCTION_NAME,"b");
        ```
        #### Command : ```node query.js```
        
   8. ## Invoke a chaincode
        #### If needed, edit the following lines in invoke.js
        ```js
          const user_name = "lion";
          const CHANNEL_NAME  = "appchannel";
          const CHAIN_CODE_NAME = "carcc";
          const CHAIN_CODE_FUNCTION_NAME = "createCar";
          await contract.submitTransaction(CHAIN_CODE_FUNCTION_NAME, "TR8800","Opel","Corsa","Light Blue","7","2050","1");
          await contract.submitTransaction(CHAIN_CODE_FUNCTION_NAME, "b","a","1");
        ```
        #### Command : ```node invoke.js```
