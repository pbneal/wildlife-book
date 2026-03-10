#!/bin/bash
# Deploy Wildlife Book website to Hostinger
# Run this script on your Hostinger server

set -e  # Exit on any error

echo "🦉 Wildlife Book Deploy Script"
echo "=============================="

# Configuration
REPO_URL="https://github.com/pbneal/wildlife-book.git"
REPO_DIR="$HOME/wildlife-book"
DEPLOY_DIR="/mydrive/wildlife-book-website"

# Check if repo exists
if [ -d "$REPO_DIR/.git" ]; then
    echo "📥 Updating existing repo..."
    cd "$REPO_DIR"
    git pull origin main
else
    echo "📥 Cloning fresh repo..."
    git clone "$REPO_URL" "$REPO_DIR"
    cd "$REPO_DIR"
fi

echo "🚀 Deploying to web server..."
if [ -d "$DEPLOY_DIR" ]; then
    # Backup existing
    echo "💾 Backing up existing deployment..."
    mv "$DEPLOY_DIR" "${DEPLOY_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Copy dist folder to web root
cp -r "$REPO_DIR/dist" "$DEPLOY_DIR"

echo "✅ Deploy complete!"
echo "🌐 Site folder: /mydrive/wildlife-book-website"
echo ""
echo "To revert if needed:"
echo "  rm -rf $DEPLOY_DIR"
echo "  mv ${DEPLOY_DIR}.backup.* $DEPLOY_DIR"
