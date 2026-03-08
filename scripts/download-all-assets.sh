#!/bin/bash
# Download all images and videos from external URLs to local server
# Run this on Hostinger server after deploying the website

set -e

WEBSITE_DIR="/var/www/html/wildlife"
IMAGE_DIR="$WEBSITE_DIR/images"
VIDEO_DIR="$WEBSITE_DIR/videos"
TEMP_DIR="/tmp/wildlife-downloads"

echo "🦉 Wildlife Book - Asset Download Script"
echo "========================================"
echo ""

# Create directories
mkdir -p "$IMAGE_DIR"
mkdir -p "$VIDEO_DIR"
mkdir -p "$TEMP_DIR"

echo "📁 Target directories:"
echo "  Images: $IMAGE_DIR"
echo "  Videos: $VIDEO_DIR"
echo ""

# ============================================
# DOWNLOAD VIDEOS FROM GOOGLE DRIVE
# ============================================
echo "🎬 Downloading Videos from Google Drive..."
echo ""

declare -A VIDEOS=(
    ["african-elephant.mp4"]="1hehw2GxE3E57LI_zW4tQBYH0iir7dyLL"
    ["lion.mp4"]="1v4soo0wcOq1yDew7e06-clZrihFmcYmY"
    ["giraffe.mp4"]="1axGsSH3cIHyb0VTCXageMXJ-joe_4i_W"
    ["zebra.mp4"]="1EsZDBRPoK7k1OelR3lLppPQXDDM3ZyS1"
    ["cheetah.mp4"]="1DPI02WZ3TyxuVvXlShnMpwjys5yQksYu"
)

for filename in "${!VIDEOS[@]}"; do
    fileid="${VIDEOS[$filename]}"
    output_path="$VIDEO_DIR/$filename"
    
    if [ -f "$output_path" ]; then
        echo "  ✓ $filename already exists"
        continue
    fi
    
    echo "  ⬇️  Downloading $filename..."
    
    # Download from Google Drive
    curl -L "https://drive.google.com/uc?export=download&id=$fileid" -o "$output_path" 2>/dev/null || \
    curl -L "https://drive.google.com/uc?export=download&confirm=t&id=$fileid" -o "$output_path" 2>/dev/null
    
    # Check file size (should be > 1MB)
    filesize=$(stat -c%s "$output_path" 2>/dev/null || stat -f%z "$output_path" 2>/dev/null || echo 0)
    
    if [ "$filesize" -gt 1048576 ]; then
        echo "     ✅ Downloaded ($(numfmt --to=iec $filesize 2>/dev/null || echo $filesize bytes))"
    else
        echo "     ❌ Failed (file too small)"
        rm -f "$output_path"
    fi
done

echo ""

# ============================================
# DOWNLOAD IMAGES FROM DISCORD/EXTERNAL URLs
# ============================================
echo "🖼️  Downloading Images from Discord..."
echo ""

# Image URLs from the Google Sheet (Discord CDN URLs)
declare -A IMAGES=(
    # African Elephant
    ["african-elephant.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1121645031825248296/Wink_african_elephant_hero_01.jpg"
    ["african-elephant-2.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1479958468328448000/Wink_african_elephant_02.jpg"
    
    # Lion
    ["lion.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1479956768328448000/Wink_lion_hero_01.jpg"
    ["lion-2.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1479956788328448000/Wink_lion_02.jpg"
    
    # Giraffe
    ["giraffe.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1121962658328448000/Wink_giraffe_hero_01.jpg"
    ["giraffe-2.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1480013088328448000/Wink_giraffe_02.jpg"
    
    # Zebra
    ["zebra.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1480039248328448000/Wink_zebra_hero_01.jpg"
    ["zebra-2.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1121965878328448000/Wink_zebra_02.jpg"
    
    # Cheetah
    ["cheetah.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1121987358328448000/Wink_cheetah_hero_01.jpg"
    ["cheetah-2.jpg"]="https://media.discordapp.net/attachments/1121549405649121463/1480018268328448000/Wink_cheetah_02.jpg"
)

for filename in "${!IMAGES[@]}"; do
    url="${IMAGES[$filename]}"
    output_path="$IMAGE_DIR/$filename"
    
    if [ -f "$output_path" ]; then
        echo "  ✓ $filename already exists"
        continue
    fi
    
    echo "  ⬇️  Downloading $filename..."
    
    # Download image
    curl -L "$url" -o "$output_path" 2>/dev/null
    
    # Check file size (should be > 10KB)
    filesize=$(stat -c%s "$output_path" 2>/dev/null || stat -f%z "$output_path" 2>/dev/null || echo 0)
    
    if [ "$filesize" -gt 10240 ]; then
        echo "     ✅ Downloaded ($(numfmt --to=iec $filesize 2>/dev/null || echo $filesize bytes))"
    else
        echo "     ❌ Failed (file too small)"
        rm -f "$output_path"
    fi
done

echo ""

# ============================================
# SET PERMISSIONS
# ============================================
echo "🔒 Setting permissions..."
chown -R www-data:www-data "$IMAGE_DIR" 2>/dev/null || true
chown -R www-data:www-data "$VIDEO_DIR" 2>/dev/null || true
chmod -R 644 "$IMAGE_DIR"/* 2>/dev/null || true
chmod -R 644 "$VIDEO_DIR"/* 2>/dev/null || true
echo "  ✅ Permissions set"

echo ""
echo "========================================"
echo "✨ Download Complete!"
echo ""
echo "📊 Summary:"
echo "  Images: $(ls -1 $IMAGE_DIR | wc -l) files"
echo "  Videos: $(ls -1 $VIDEO_DIR | wc -l) files"
echo ""
echo "📁 Locations:"
echo "  $IMAGE_DIR"
echo "  $VIDEO_DIR"
echo ""

# List downloaded files
echo "🖼️  Images:"
ls -lh "$IMAGE_DIR" | tail -n +2 | awk '{printf "  %-30s %10s\n", $9, $5}'

echo ""
echo "🎬 Videos:"
ls -lh "$VIDEO_DIR" | tail -n +2 | awk '{printf "  %-30s %10s\n", $9, $5}'
