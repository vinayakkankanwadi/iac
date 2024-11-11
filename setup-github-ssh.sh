#!/bin/bash

# Variables
SSH_KEY_FILE="$HOME/.ssh/id_rsa"
GITHUB_USER_EMAIL="your_email@example.com"  # Replace with your GitHub email

# Check if SSH key already exists
if [[ -f "$SSH_KEY_FILE" ]]; then
  echo "SSH key already exists at $SSH_KEY_FILE"
else
  # Generate a new SSH key pair
  echo "Generating new SSH key..."
  ssh-keygen -t rsa -b 4096 -C "$GITHUB_USER_EMAIL" -f "$SSH_KEY_FILE" -N ""
fi

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add the SSH private key to the SSH agent
ssh-add "$SSH_KEY_FILE"

# Display the public key
echo "Your SSH public key (add this to your GitHub SSH keys):"
cat "$SSH_KEY_FILE.pub"

# Test the SSH connection to GitHub
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

echo "SSH setup for GitHub is complete."
