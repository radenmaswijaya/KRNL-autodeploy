#!/bin/bash

echo "=== [1/6] Update & install dependencies ==="
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git unzip build-essential wget

echo "=== [2/6] Install Node.js & npm (v20.x) ==="
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

echo "=== [3/6] (Optional) Install Bun ==="
curl -fsSL https://bun.sh/install | bash
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

echo "=== [4/6] Install Foundry (forge) ==="
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc
foundryup

echo "=== [5/6] Tambahkan swap (2GB) jika RAM kecil ==="
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "=== [6/6] Install KRNL CLI ==="
npm install -g krnl-cli

echo "=== Selesai! Jalankan 'krnl init' dan 'krnl setup' untuk mulai ===" 
