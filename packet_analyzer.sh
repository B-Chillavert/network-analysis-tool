#!/bin/bash

# ==========================================
# Automated Network Traffic Analyzer
# Created for Security Portfolio & Packet Analysis
# ==========================================

echo "=========================================="
echo "Starting Automated Packet Capture Utility..."
echo "=========================================="
echo ""

# Define file storage paths
OUTPUT_FILE="captured_traffic.pcap"
INTERFACE="eth0"
PACKET_COUNT=25

echo "[*] Targeted Interface: $INTERFACE"
echo "[*] Capturing limit: $PACKET_COUNT packets"
echo "[*] Saving raw binary data to: $OUTPUT_FILE"
echo ""
echo "[*] Analysis engine active. Please generate network activity..."

# Run tcpdump in the background and save to a file (-w)
sudo tcpdump -i $INTERFACE -c $PACKET_COUNT -w $OUTPUT_FILE

echo ""
echo "=========================================="
echo "[+] Capture Finished! Packet file compiled successfully."
echo "=========================================="
