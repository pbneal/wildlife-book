#!/bin/bash
# Deploy script for wildlife-book website
# Run this from the website directory on Hostinger

set -e  # Exit on any error

echo "🦉 Deploying Wildlife Book site..."

echo "📥 Pulling latest changes..."
git pull origin main

echo "📦 Installing dependencies..."
npm install

echo "🔨 Building site..."
npm run build

echo "🚀 Syncing to web server..."
sudo rsync -avz --delete dist/ /var/www/html/wildlife/

echo "✅ Deploy complete!"
echo "🌐 Site live at: https://nx3creations.com/wildlife/"
