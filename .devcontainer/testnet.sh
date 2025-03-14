#!/bin/bash

clear

echo "=========================================="
echo "  Soroban Testnet Terminal"
echo "=========================================="
echo ""
echo "Environment variables:"
echo "  SOROBAN_RPC_URL: $SOROBAN_RPC_URL"
echo "  SOROBAN_NETWORK_PASSPHRASE: $SOROBAN_NETWORK_PASSPHRASE"
echo ""
echo "Common commands:"
echo "  stellar account create <name>"
echo "  stellar contract deploy <file>"
echo "  stellar contract invoke --id <id> --fn <function> [--arg <arg>]"
echo ""
echo "=========================================="