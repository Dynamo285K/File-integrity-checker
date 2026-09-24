# File Integrity Checker

A simple and secure Bash script for monitoring file integrity (such as system logs) and detecting unauthorized modifications (tampering). The tool utilizes the SHA-256 cryptographic algorithm for secure verification of changes.

## Features
* **init:** Computes and securely stores SHA-256 hashes for a specified file or all files within a given directory.
* **check:** Compares the current state of files against the stored hashes in the database and clearly reports any mismatch (indicating possible tampering).
* **update:** Safely updates the stored hash for a specific file if it was legitimately modified, preventing duplicate records.

## Usage

The script requires two arguments: the requested action (`init`, `check`, `update`) and the path to the target file or directory.

```bash
# Initialize (store hashes for the first time)
./file-integrity-checker.sh init /var/log/syslog

# Check for changes
./file-integrity-checker.sh check /var/log/syslog

# Update hash after a legitimate modification
./file-integrity-checker.sh update /var/log/syslog
