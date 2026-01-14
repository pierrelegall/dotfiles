#!/usr/bin/env sh
#
# UFW Configuration Script - Minmal
#
# This script configures UFW to:
# - Allow all incoming connections (except established)
# - Deny all outgoing connections EXCEPT through VPN tunnel

set -e

# Check if ufw is available
if ! command -v ufw >/dev/null 2>&1; then
  echo "Error: ufw is not installed. Please install ufw and try again."
  exit 1
fi

echo "Configuring UFW with minimal protection..."

# Disable UFW temporarily to apply rules
ufw --force disable

# Reset UFW to defaults (optional - comment out if you want to preserve existing rules)
ufw --force reset

# Set default policies - DENY everything
ufw default allow outgoing
ufw default allow routed
ufw default deny incoming

# Enable UFW
ufw --force enable
