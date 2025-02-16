#!/bin/bash

# Define the key name and path
KEY_NAME="$1"
KEY_PATH="$2"
EMAIL="$3"

# Check if the key already exists
if [ ! -f "$KEY_PATH" ]; then
  # Generate the SSH key pair
  ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$KEY_PATH" -N ""
  echo "SSH key pair generated at $KEY_PATH"
else
  echo "SSH key pair already exists at $KEY_PATH"
fi