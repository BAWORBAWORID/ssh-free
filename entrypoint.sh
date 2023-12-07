#!/bin/bash

# Install Ngrok
sudo apt-get update -y > /dev/null 2>&1 && apt-get install curl openssh-server -y > /dev/null 2>&1
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok
rm ngrok-stable-linux-amd64.zip

# Authenticate Ngrok
./ngrok authtoken 2Z9JnNgTw3xNzxqA7q9GwexVogN_5FSc461rh5GFQxGUwCApc

# Start SSH Tunnel
./ngrok tcp 22 &

# Wait for Ngrok to establish tunnel
sleep 5

# Retrieve Ngrok tunnel URL
NGROK_URL=$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

echo "VPS SSH telah dibuat!"
echo "Anda dapat mengaksesnya dengan menggunakan SSH client dan menghubungkan ke:"
echo $NGROK_URL > /dev/null
