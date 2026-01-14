#!/usr/bin/env sh

# UFW Configuration Script - WireGuard VPN Killswitch
# This script configures UFW to:
# - Deny all incoming connections (except established)
# - Deny all outgoing connections EXCEPT through VPN tunnel
# - Allow local network (LAN) traffic
# - Allow loopback traffic

set -e

# Check if ufw is available
if ! command -v ufw >/dev/null 2>&1; then
  echo "Error: ufw is not installed. Please install ufw and try again."
  exit 1
fi

echo "Configuring UFW with WireGuard killswitch..."

# Disable UFW temporarily to apply rules
ufw --force disable

# Reset UFW to defaults (optional - comment out if you want to preserve existing rules)
ufw --force reset

# Set default policies - DENY everything
ufw default deny incoming comment "Default deny in"
ufw default deny outgoing comment "Default deny out"
ufw default deny routed comment "Default deny routed"

# Uncomment these lines if you need Docker/Podman containers to access the internet:
# ufw route allow in on docker0 out on wg0
# ufw route allow in on wg0 out on docker0
# ufw route allow in on podman0 out on wg0
# ufw route allow in on wg0 out on podman0

# Deny all IPv6 traffic first (before any allow rules)
# ufw deny in from ::/0
# ufw deny out to ::/0

# Allow loopback interface (localhost)
ufw allow in on lo from 127.0.0.0/8 to 127.0.0.0/8 comment "Local loopback in"
ufw allow out on lo from 127.0.0.0/8 to 127.0.0.0/8 comment "Local loopback out"

# Allow local network (LAN) traffic
ufw allow out from any to 192.168.0.0/16 comment "LAN out"
ufw allow out from any to 10.0.0.0/8 comment "LAN out"
ufw allow out from any to 172.16.0.0/12 comment "LAN out"

# Allow outgoing traffic through WireGuard interface (wg0)
ufw allow out on wg0 from any to any comment "WireGuard traffic" # 0.0.0.0/0 to 0.0.0.0/0

# Allow WireGuard protocol (UDP) - needed to establish VPN connection
ufw allow out from any to any port 51820 proto udp comment "Default WireGuard handshake port"

# Enable UFW
ufw --force enable
