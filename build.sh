#!/bin/bash
set -e

# Install Quarto
echo "Installing Quarto..."
curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.deb -o quarto-1.4.550-linux-amd64.deb
dpkg -i quarto-1.4.550-linux-amd64.deb || apt-get install -f -y

# Render the Quarto project
echo "Rendering Quarto project..."
quarto render

echo "Build complete!"
