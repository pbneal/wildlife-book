#!/bin/bash
# Deploy script for Hostinger VPS
# Run this on your VPS to pull latest changes and rebuild

cd ~/wildlife-book-website || exit 1

echo "Pulling latest changes..."
git pull origin main

echo "Installing dependencies..."
npm install

echo "Building site..."
npm run build

echo "Copying to web root..."
rsync -avz --delete dist/ /public_html/wildlife/

echo "Done! Site deployed to wildlife.nx3creations.com"
