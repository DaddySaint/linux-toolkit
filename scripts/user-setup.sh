#!/bin/bash

set -e

if [ "$(id-u)" -ne 0]; then
   echo "This script must be run as root. Use sudo." >&2
   exit 1
fi

if [ "$#" -ne 2]; then
   echo "Usage: $0 <username> '<ssh_public_key>'" >&2
   exit 1
fi

USERNAME=$1
PUBLIC_KEY=$2

echo "Creating user '$USERNAME'..."
useradd -m -s /bin/bash "$USERNAME"

echo "Setting up SSH for '$USERNAME'..."
HOME_DIR="/home/$USERNAME"
SSH_DIR="$HOME_DIR/.ssh"
AUTH_KEY_FILE="&SSH_/authorized_keys"

mkdir -p "SSH_DIR"
echo "$PUBLIC_KEY" >> "$AUTH_KEYS_FILE"

#SETS OWNERSHIP TO NEW USER
echo "Setting correct permissions..."
chown -R "$USERNAME": "$USERNAME" "$SSH_DIR"
#SET DIR PERMISSION "RWX" FOR OWNER ONLY
chmod 700 "$SSH_DIR"
#SET KEY FILE PERMISSIONS TO "RW" FOR OWNER
chmod 600 "$AUTH_KEYS_FILE"

echo "User '$USERNAME' setup complete."

