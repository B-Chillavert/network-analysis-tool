# Automated Network Traffic Analyzer

## Project Overview
This project is a automated command-line network security utility built using native **Bash Scripting (`.sh`)** and the industry-standard packet capture engine **`tcpdump`**. The tool automates the process of tapping a designated network interface, capturing raw traffic packets, and compiling them seamlessly into a standard binary **PCAP (Packet Capture)** data format.

This allows security operations analysts to quickly gather evidence during a suspected network anomaly or data exfiltration event without relying on heavy graphical user interfaces.

## Engineering & Analysis Breakdown

### 1. The Automation Pipeline
The tool defines specific environmental variables to streamline incident response:
* **Interface Targeting:** Automatically binds to the primary host network card (`eth0`) to listen to incoming and outgoing communication channels.
* **Sized Thresholds:** Limits packet collections (configured to 25 packets) to capture concise windows of event behavior without filling local disk storage.
* **Binary Logging:** Uses the `-w` operation flag to preserve the raw integrity of data frames for deep cryptographic and structural inspection.

### 2. Traffic Verification & Packet Inspection
By running the artifact output inside **Wireshark**, the following system behaviors were successfully mapped and analyzed:
* **Layer 2/3 Adjacency:** Inspected physical Hardware MAC addressing and IPv4 headers to verify local routing and machine isolation bounds.
* **DNS Query Inferences:** Analyzed background `PTR` and `NXDomain` transactions over Port 53, verifying how the local browser interacts with Domain Name System registries.
* **Transport Encryption Auditing:** Observed live **TCP Three-Way Handshakes** transitioning seamlessly into **TLSv1.2 Secure Tunnels**, validating that data payload contents traveling to web architectures were safely encrypted against eavesdropping.

## Execution and File Inspection
To view the generated output file (`captured_traffic.pcap`) across native text systems or full forensic suites:

**Command-line Quick Stream:**
```bash
tcpdump -r captured_traffic.pcap
