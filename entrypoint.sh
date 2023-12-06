#!/bin/bash

# Start SSH server
service ssh start

# Display IP address and username
IP=$(hostname -I | awk '{print $1}')
echo "SSH Server IP: ${IP}"
echo "SSH Username: ${SSH_USER}"

# Keep the container running
tail -f /dev/null
