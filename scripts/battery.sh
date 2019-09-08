#!/bin/sh

acpi | grep -oP '\b\d*\b%'
