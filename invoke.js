/*
 * SPDX-License-Identifier: Apache-2.0
 */

"use strict";

const { FileSystemWallet, Gateway } = require("fabric-network");
const fs = require("fs");
const path = require("path");

const ccpPath = path.resolve(__dirname, ".", "network_profile.json");

// const user_name = "lion";
// const CHANNEL_NAME  = "appchannel";
// const CHAIN_CODE_NAME = "carcc";
// const CHAIN_CODE_FUNCTION_NAME = "createCar";

const user_name = "lion";
const CHANNEL_NAME = "appchannel";
const CHAIN_CODE_NAME = "testcc";
const CHAIN_CODE_FUNCTION_NAME = "invoke";

async function main() {
  try {
    // Create a new file system based wallet for managing identities.
    const walletPath = path.join(process.cwd(), "wallet");
    const wallet = new FileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    // Check to see if we've already enrolled the user.
    const userExists = await wallet.exists(user_name);
    if (!userExists) {
      console.log(
        'An identity for the user "user1" does not exist in the wallet'
      );
      console.log("Run the registerUser.js application before retrying");
      return;
    }
    const clientKey = fs.readFileSync(
      path.join(__dirname, "./hlft-store/orgca/peer2/msp/tls/server.key")
    );
    const clientCert = fs.readFileSync(
      path.join(__dirname, "./hlft-store/orgca/peer2/msp/tls/server.crt")
    );
    // Create a new gateway for connecting to our peer node.
    const gateway = new Gateway();
    await gateway.connect(ccpPath, {
      wallet,
      identity: user_name,
      discovery: { enabled: false, asLocalhost: false },
    });

    //set TLS certs for CLIENTAUTH
    const client = await gateway.getClient();
    client.setTlsClientCertAndKey(
      Buffer.from(clientCert).toString(),
      Buffer.from(clientKey).toString()
    );

    // Get the network (channel) our contract is deployed to.
    const network = await gateway.getNetwork(CHANNEL_NAME);

    // Get the contract from the network.
    const contract = network.getContract(CHAIN_CODE_NAME);

    // Submit the specified transaction.
    // createCar transaction - requires 5 argument, ex: ('createCar', 'CAR12', 'Honda', 'Accord', 'Black', 'Tom')
    // changeCarOwner transaction - requires 2 args , ex: ('changeCarOwner', 'CAR10', 'Dave')

    //await contract.submitTransaction(CHAIN_CODE_FUNCTION_NAME, "BE8800","Opel","Corsa","Light Blue","7","2050","1");

    await contract.submitTransaction(CHAIN_CODE_FUNCTION_NAME, "b", "a", "15");

    console.log("Transaction has been submitted");

    // Disconnect from the gateway.
    await gateway.disconnect();
  } catch (error) {
    console.error(`Failed to submit transaction: ${error}`);
    process.exit(1);
  }
}

main();
