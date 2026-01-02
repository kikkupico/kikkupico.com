#!/bin/bash
set -e

# Install Quarto
echo "Installing Quarto..."
curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.tar.gz -o quarto.tar.gz
mkdir -p quarto-cli
tar -xzf quarto.tar.gz -C quarto-cli --strip-components=1
export PATH="$PWD/quarto-cli/bin:$PATH"

# Render the Quarto project
echo "Rendering Quarto project..."
quarto render

echo "Build complete!"
