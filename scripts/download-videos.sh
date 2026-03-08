#!/bin/bash
# Download videos from Google Drive to local server
# Run this on Hostinger server

set -e

WEBSITE_DIR="/var/www/html/wildlife"
VIDEO_DIR="$WEBSITE_DIR/videos"
TEMP_DIR="/tmp/video-downloads"

# Create directories
mkdir -p "$VIDEO_DIR"
mkdir -p "$TEMP_DIR"

echo "🎬 Downloading videos from Google Drive..."
echo "Target directory: $VIDEO_DIR"
echo ""

# Video file IDs from Google Drive (extracted from the sheet)
declare -A VIDEOS=(
    ["african-elephant.mp4"]="1hehw2GxE3E57LI_zW4tQBYH0iir7dyLL"
    ["lion.mp4"]="1v4soo0wcOq1yDew7e06-clZrihFmcYmY"
    ["giraffe.mp4"]="1axGsSH3cIHyb0VTCXageMXJ-joe_4i_W"
    ["zebra.mp4"]="1EsZDBRPoK7k1OelR3lLppPQXDDM3ZyS1"
    ["cheetah.mp4"]="1DPI02WZ3TyxuVvXlShnMpwjys5yQksYu"
)

# Download each video
for filename in "${!VIDEOS[@]}"; do
    fileid="${VIDEOS[$filename]}"
    output_path="$VIDEO_DIR/$filename"
    temp_path="$TEMP_DIR/$filename"
    
    if [ -f "$output_path" ]; then
        echo "✓ $filename already exists, skipping"
        continue
    fi
    
    echo "⬇️  Downloading $filename..."
    
    # Use curl to download from Google Drive
    # First, get the confirmation token for large files
    curl -L -c "$TEMP_DIR/cookies.txt" "https://drive.google.com/uc?export=download&id=$fileid" > "$temp_path.html" 2>/dev/null
    
    # Check if we need confirmation
    if grep -q "confirm=" "$temp_path.html"; then
        confirm=$(grep -o 'confirm=[^&]*' "$temp_path.html" | head -1 | cut -d'=' -f2)
        curl -L -b "$TEMP_DIR/cookies.txt" "https://drive.google.com/uc?export=download&confirm=$confirm&id=$fileid" -o "$temp_path" 2>/dev/null
    else
        mv "$temp_path.html" "$temp_path"
    fi
    
    # Check if download was successful (file should be > 1MB for videos)
    filesize=$(stat -f%z "$temp_path" 2>/dev/null || stat -c%s "$temp_path" 2>/dev/null || echo 0)
    
    if [ "$filesize" -gt 1048576 ]; then
        mv "$temp_path" "$output_path"
        echo "✅ Downloaded $filename ($(numfmt --to=iec $filesize 2>/dev/null || echo $filesize bytes))"
    else
        echo "❌ Failed to download $filename (file too small: $filesize bytes)"
        rm -f "$temp_path"
    fi
done

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "✨ Done!"
echo "Videos saved to: $VIDEO_DIR"
echo ""
ls -lh "$VIDEO_DIR"
