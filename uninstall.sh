#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Stop pm2 process if running
if command_exists pm2; then
    pm2 stop my-app
    pm2 delete my-app
fi

# Remove Node.js version installed by NVS
if command_exists nvs; then
    nvs rm 14.14.0
fi

# Remove NVS
if [ -d "$HOME/.nvs" ]; then
    echo "Removing NVS..."
    rm -rf "$HOME/.nvs"
fi

# Remove meteor
if command_exists meteor; then
    echo "Removing meteor..."
    npm uninstall -g meteor
fi

# Remove pm2
if command_exists pm2; then
    echo "Removing pm2..."
    npm uninstall -g pm2
fi

# Remove empirica app directory
if [ -d "$HOME/my-app" ]; then
    echo "Removing empirica app directory..."
    rm -rf "$HOME/my-app"
fi

# Remove script.sh
if [ -f "$HOME/script.sh" ]; then
    echo "Removing script.sh..."
    rm -f "$HOME/script.sh"
fi

echo "Uninstallation complete."