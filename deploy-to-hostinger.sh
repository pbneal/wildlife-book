#!/bin/bash
# Deploy Wildlife Book website to Hostinger
# Run this script on your Hostinger server

set -e  # Exit on any error

echo "🦉 Wildlife Book Deploy Script"
echo "=============================="

# Configuration
REPO_URL="https://github.com/pbneal/wildlife-book.git"
DEPLOY_DIR="$HOME/wildlife-book-website"
TEMP_DIR="/tmp/wildlife-book-deploy"

echo "📥 Cloning fresh repo..."
rm -rf "$TEMP_DIR"
git clone "$REPO_URL" "$TEMP_DIR"

echo "🚀 Deploying to web server..."
if [ -d "$DEPLOY_DIR" ]; then
    # Backup existing
    echo "💾 Backing up existing deployment..."
    mv "$DEPLOY_DIR" "${DEPLOY_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Copy dist folder contents to deploy directory
mkdir -p "$DEPLOY_DIR"
cp -r "$TEMP_DIR/dist/"* "$DEPLOY_DIR/"

# Clean up temp
rm -rf "$TEMP_DIR"

echo "✅ Deploy complete!"
echo "🌐 Site folder: $DEPLOY_DIR"
echo ""
echo "Files deployed:"
ls -la "$DEPLOY_DIR" | head -10
