#!/bin/bash
set -x #echo on

IP_ADDRESS="164.90.214.237"
REMOTE_MACHINE_TLS_CERT_FILE="/root/hlft-store/hlfMSP/tlscacerts/tls-tlsca-7054.pem"
LOCAL_TLS_CERT_FILE="./hlft-store/hlfMSP/tlscacerts/tls-tlsca-7054.pem"

scp -r root@$IP_ADDRESS:$REMOTE_MACHINE_TLS_CERT_FILE $LOCAL_TLS_CERT_FILE