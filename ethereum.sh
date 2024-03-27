#!/bin/bash

RPC_URL="https://eth1.lava.build/lava-referer-323f6f29-342e-4b85-b8e8-d32804f59173/"

OUTPUT_DIR="logs"

eth_data=$(curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi
