#!/usr/bin/env bash
set -e

echo "==> Checking for git-lfs..."
if ! command -v git-lfs &> /dev/null; then
    echo "==> git-lfs not found in system PATH. Downloading portable binary..."
    curl -sL https://github.com/git-lfs/git-lfs/releases/download/v3.5.1/git-lfs-linux-amd64-v3.5.1.tar.gz -o git-lfs.tar.gz
    tar -xzf git-lfs.tar.gz
    chmod +x git-lfs
    export PATH="$(pwd):$PATH"
fi

echo "==> Pulling Git LFS models and datasets..."
git lfs install
git lfs pull

echo "==> Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "==> Backend build completed successfully!"
