#!/bin/bash
set -e

# Install Quarto to /tmp to avoid it being included in the project
echo "Installing Quarto..."
curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.557/quarto-1.4.557-linux-amd64.tar.gz -o /tmp/quarto.tar.gz
mkdir -p /tmp/quarto-cli
tar -xzf /tmp/quarto.tar.gz -C /tmp/quarto-cli --strip-components=1
export PATH="/tmp/quarto-cli/bin:$PATH"

# Install TinyTeX for PDF generation
echo "Installing TinyTeX..."
quarto install tinytex --update-path --quiet

# Render the Quarto project (HTML)
echo "Rendering Quarto project..."
quarto render

# Render the Resume PDF
echo "Rendering Resume PDF..."
quarto render resume.qmd --to pdf

echo "Build complete!"
