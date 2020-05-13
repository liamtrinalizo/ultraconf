#!/bin/bash

# Require root
rc-service cupsd start

# list available interface
lpinfo -v

# List status of created printers
lpstat -a

# Set USB printer as default
lpadmin -d Canon_MX490_series

