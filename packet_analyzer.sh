#!/bin/bash
# --------------------------------------------------
# CRITICAL PRIVILEGE CHECK: Ensure script is run as root
# --------------------------------------------------
if [ "$EUID" -ne 0 ]; then
    echo "=================================================="
    echo "[!] ERROR: This security utility requires administrative privileges."
    echo "[!] Please re-run this tool using: sudo ./packet_analyzer.sh"
    echo "=================================================="
    exit 1
fi

# ==========================================
# Automated Network Traffic Analyzer (v2.0)
# Upgraded: Interactive Input & Validation
# ==========================================

echo "=========================================="
echo "Starting Automated Packet Capture Utility..."
echo "=========================================="
echo ""

# 1. Dynamically prompt the user for the Network Interface
read -p "[?] Enter the network interface to target (e.g., eth0): " INTERFACE

# Quick validation: Check if the user left it blank
if [ -z "$INTERFACE" ]; then
    echo "[!] Error: Interface cannot be blank. Defaulting to eth0."
    INTERFACE="eth0"
fi

# 2. Dynamically prompt the user for the Packet Count
read -p "[?] Enter the number of packets to capture (e.g., 10, 25, 50): " PACKET_COUNT

# Quick validation: If input is not a number, default to 15
if ! [[ "$PACKET_COUNT" =~ ^[0-8]+$ ]]; then
    echo "[!] Invalid number or blank. Defaulting to 15 packets."
    PACKET_COUNT=15
fi

# Define dynamic output file name based on the interface used
OUTPUT_FILE="captured_${INTERFACE}_traffic.pcap"

echo ""
echo "[*] Targeted Interface: $INTERFACE"
echo "[*] Capturing limit: $PACKET_COUNT packets"
echo "[*] Saving raw binary data to: $OUTPUT_FILE"
echo ""
echo "[*] Analysis engine active. Please generate network activity..."

# Run tcpdump using the dynamic variables
sudo tcpdump -i $INTERFACE -c $PACKET_COUNT -w $OUTPUT_FILE

echo ""
echo "=========================================="
echo "[+] Capture Finished! $OUTPUT_FILE compiled successfully."
echo "=========================================="
