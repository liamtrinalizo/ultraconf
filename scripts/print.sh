#!/bin/bash

# Require root
rc-service cupsd start

# list available interface
lpinfo -v

# List status of created printers
lpstat -a

# Create network printer
lpadmin -p printer-name -E -v socket://ip-address-of-network-printer -m printer-make-and-model

# Set USB printer as default
lpadmin -d printer-name

# Print file on default printer
lp <file>
