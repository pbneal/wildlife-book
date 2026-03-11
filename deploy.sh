#!/bin/bash
# Deploy script for Hostinger VPS
# Run this on your VPS to pull latest changes and rebuild

set -e  # Exit on any error

echo "🦉 Wildlife Book Deploy Script"
echo "=============================="

# Go to the git repo
cd ~/wildlife-book || exit 1

echo "📥 Pulling latest changes from GitHub..."
git pull origin main

echo "📦 Installing dependencies..."
npm install

echo "🔨 Building site..."
npm run build

echo "🚀 Copying to web root..."
rsync -avz --delete dist/ ~/public_html/wildlife/

echo ""
echo "✅ Deploy complete!"
echo "🌐 Site live at: https://wildlife.nx3creations.com"
echo ""
echo "Files deployed:"
ls -la ~/public_html/wildlife/ | head -10
