#!/bin/bash

# Define the key name and path
SSH_KEY_DIR="$(dirname "$0")"
KEY_NAME="tf_user"
KEY_PATH="$SSH_KEY_DIR/$KEY_NAME"

# Check if the key exists
if [ -f "$KEY_PATH" ]; then
  # Delete the SSH key pair
  rm -f "$KEY_PATH" "$KEY_PATH.pub"
  echo "SSH key pair deleted from $KEY_PATH"
else
  echo "SSH key pair does not exist at $KEY_PATH"
fi