#!/bin/bash

# Install Ngrok
sudo apt-get update -y > /dev/null 2>&1 && apt-get install curl netstat openssh-server -y > /dev/null 2>&1



# Mendapatkan alamat IP publik
#ip=$(curl -s http://api.ipify.org)

# Mendapatkan port SSH
port=$(netstat -tuln | grep "ssh" | awk '{print $4}' | awk -F ":" '{print $NF}')

echo "Alamat IP Anda adalah: $ip"
echo "Port SSH yang digunakan adalah: $port"

echo "VPS SSH telah dibuat!"
echo "Anda dapat mengaksesnya dengan menggunakan SSH client dan menghubungkan ke:"
curl -s https://checkip.amazonaws.com
