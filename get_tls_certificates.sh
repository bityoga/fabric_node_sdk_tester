#!/bin/bash
set -x #echo on

IP_ADDRESS="165.232.76.37"
#REMOTE_MACHINE_TLS_CERT_FILE="/root/hlft-store/hlfMSP/tlscacerts/tls-tlsca-7054.pem"
#LOCAL_TLS_CERT_FILE="./hlft-store/hlfMSP/tlscacerts/tls-tlsca-7054.pem"

REMOTE_MACHINE_PEER2_TLS_CA_CERT_FILE="/root/hlft-store/tlsca/peer2/tls-msp/tlscacerts/tls-tlsca-7054.pem"
LOCAL_PEER2_TLS_CA_CERT_FILE="./hlft-store/tlsca/peer2/tls-msp/tlscacerts/tls-tlsca-7054.pem"

REMOTE_MACHINE_PEER2_TLS_SERVER_CERT_FILE="/root/hlft-store/orgca/peer2/msp/tls/server.crt"
LOCAL_PEER2_TLS_SERVER_CERT_FILE="./hlft-store/orgca/peer2/msp/tls/server.crt"

REMOTE_MACHINE_PEER2_TLS_SERVER_KEY_FILE="/root/hlft-store/orgca/peer2/msp/tls/server.key"
LOCAL_PEER2_TLS_SERVER_KEY_FILE="./hlft-store/orgca/peer2/msp/tls/server.key"


REMOTE_MACHINE_ORDERER_TLS_CA_CERT_FILE="/root/hlft-store/tlsca/orderer/tls-msp/tlscacerts/tls-tlsca-7054.pem"
LOCAL_ORDERER_TLS_CA_CERT_FILE="./hlft-store/tlsca/orderer/tls-msp/tlscacerts/tls-tlsca-7054.pem"

# REMOTE_MACHINE_ORDERER_TLS_SERVER_CERT_FILE="/root/hlft-store/orgca/orderer/msp/tls/server.crt"
# LOCAL_ORDERER_TLS_SERVER_CERT_FILE="./hlft-store/orgca/orderer/msp/tls/server.crt"

# REMOTE_MACHINE_ORDERER_TLS_SERVER_KEY_FILE="/root/hlft-store/orgca/orderer/msp/tls/server.key"
# LOCAL_ORDERER_TLS_SERVER_KEY_FILE="./hlft-store/orgca/orderer/msp/tls/server.key"

#scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_TLS_CERT_FILE $LOCAL_TLS_CERT_FILE

scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_ORDERER_TLS_CA_CERT_FILE $LOCAL_ORDERER_TLS_CA_CERT_FILE
# scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_ORDERER_TLS_SERVER_CERT_FILE $LOCAL_ORDERER_TLS_SERVER_CERT_FILE
# scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_ORDERER_TLS_SERVER_KEY_FILE $LOCAL_ORDERER_TLS_SERVER_KEY_FILE



scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_PEER2_TLS_CA_CERT_FILE $LOCAL_PEER2_TLS_CA_CERT_FILE
scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_PEER2_TLS_SERVER_CERT_FILE $LOCAL_PEER2_TLS_SERVER_CERT_FILE
scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_PEER2_TLS_SERVER_KEY_FILE $LOCAL_PEER2_TLS_SERVER_KEY_FILE