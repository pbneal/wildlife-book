# Wildlife Book Website — Project Notes

## Naming Convention for Media Files

Animal images and videos must match the animal's slug from `animals.json`:

```
/images/{animal-slug}.png   — Static hero image
/images/{animal-slug}.mp4   — Video background (optional)
```

### Current Media Files
- `lion.png` / `lion.mp4` — Lion page
- `african-elephant.png` / `african-elephant.mp4` — African Elephant page

### To Add New Animals
1. Generate image (PNG) and optionally video (MP4)
2. Name files using the animal's slug from animals.json
3. Upload to `public/images/`
4. Commit and push to GitHub
5. Deploy to Hostinger

## Deploy Command
```bash
cd ~/wildlife-book-website
./deploy-hostinger.sh
```

## Future Enhancements (Ideas)

### Interactive Continent Map
- SVG map of each continent
- Regions outlined and clickable
- Hover effects highlight regions
- Could show region preview on hover

### Region Pages
- Individual pages for subregions (East Africa, West Africa, etc.)
- Link from continent page region grid
- Show animals specific to that region

### Image Gallery
- Lightbox for viewing full-size images
- Gallery grid on animal pages
- Before/after sliders for AI generation process

### Video Enhancements
- Video toggle (play/pause) for users
- Video progress indicator
- Optional ambient audio (if user enables)
