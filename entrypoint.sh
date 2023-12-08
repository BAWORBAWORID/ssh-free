#!/bin/bash

# Install Ngrok
sudo apt-get update -y > /dev/null 2>&1 && apt-get install curl openssh-server -y > /dev/null 2>&1

echo "VPS SSH telah dibuat!"
echo "Anda dapat mengaksesnya dengan menggunakan SSH client dan menghubungkan ke:"
curl -s https://checkip.amazonaws.com
