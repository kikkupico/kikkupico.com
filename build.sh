#!/bin/bash
set -e

# Install Quarto to /tmp to avoid it being included in the project
echo "Installing Quarto..."
curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.tar.gz -o /tmp/quarto.tar.gz
mkdir -p /tmp/quarto-cli
tar -xzf /tmp/quarto.tar.gz -C /tmp/quarto-cli --strip-components=1
export PATH="/tmp/quarto-cli/bin:$PATH"

# Render the Quarto project
echo "Rendering Quarto project..."
quarto render

echo "Build complete!"
