#!/bin/bash

# GitHub repository URL for Empirica app
EMPIRICA_REPO_URL="https://github.com/example/empirica-app"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to clone repository if not already cloned
clone_repository() {
    local repo_url="$1"
    local target_dir="$2"
    if [ ! -d "$target_dir" ]; then
        git clone "$repo_url" "$target_dir"
    fi
}

# Ensure git is installed
if ! command_exists git; then
    echo "Installing git..."
    sudo yum install git -y
fi

# Ensure NVS is installed
NVS_HOME="$HOME/.nvs"
if [ ! -d "$NVS_HOME" ]; then
    echo "Installing NVS..."
    git clone https://github.com/jasongin/nvs "$NVS_HOME"
    . "$NVS_HOME/nvs.sh" install
fi

# Ensure Node.js 14 is installed
if ! nvs ls | grep -q "14.14.0"; then
    echo "Installing Node.js 14..."
    nvs add 14.14.0
    nvs use 14.14.0
    nvs link 14.14.0
fi

# Update all packages
echo "Updating all packages..."
sudo yum update -y

# Install meteor
echo "Installing meteor..."
npm install -g meteor

# Install pm2
echo "Installing pm2..."
npm install -g pm2

# Clone Empirica app repository
echo "Cloning Empirica app repository..."
clone_repository "$EMPIRICA_REPO_URL" "$HOME/my-app"
cd "$HOME/my-app" || exit

# Create app script.sh
echo "Creating app script.sh..."
echo "meteor --settings local.json" >> script.sh
chmod +x script.sh

# Run in the background
echo "Running in the background..."
pm2 start --name my-app script.sh

# Display credentials
echo "Your app is running at http://localhost:3000"
echo "Your admin credentials are:"
cat local.json | grep "username"
cat local.json | grep "password"
