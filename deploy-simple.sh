#!/bin/bash
# Simple deploy script - copies dist files to wildlife-book-website

REPO_DIR="$HOME/wildlife-book"
DEPLOY_DIR="$HOME/wildlife-book-website"

echo "Pulling latest changes..."
cd "$REPO_DIR"
git pull origin main

echo "Clearing old files..."
rm -rf "$DEPLOY_DIR"/*

echo "Copying new files..."
cp -r "$REPO_DIR"/dist/* "$DEPLOY_DIR"/

echo "Done! Files in: $DEPLOY_DIR"
ls "$DEPLOY_DIR"
