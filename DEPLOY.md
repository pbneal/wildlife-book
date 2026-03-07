# Wildlife Book Website — Deployment Guide

## What's Built

A complete Astro-based website for the Wildlife Photography Book project:

### Pages
- **Homepage** (`/`) — Hero, continent grid, featured animals, about preview
- **Continents List** (`/continents/`) — All 7 continents with status
- **Continent Pages** (`/continents/[name]/`) — Individual continent content + featured animals
- **Animal Pages** (`/animals/[name]/`) — Individual animal profiles with stats
- **About** (`/about/`) — Project philosophy and details

### Content
- **7 Continents** — Africa, Asia, North America, South America, Europe, Australia, Antarctica
- **10 Animals** — African Elephant, Lion, Giraffe, Zebra, Cheetah, Hippopotamus, Bengal Tiger, Giant Panda, Grizzly Bear, Bald Eagle

### Features
- Dark, elegant design with Cormorant Garamond + Inter fonts
- Responsive layout
- Conservation status badges
- Emoji placeholders (ready for AI-generated images)
- Static HTML export for fast loading

## Deployment Options

### Option 1: Netlify (Recommended)

```bash
cd /root/.openclaw/workspace/projects/wildlife-book/website
# Deploy dist folder to Netlify
```

Or drag-and-drop the `dist/` folder at <https://app.netlify.com/drop>

### Option 2: Vercel

```bash
cd /root/.openclaw/workspace/projects/wildlife-book/website
npx vercel --prod
```

### Option 3: Subdomain of nx3creations.com

1. Upload `dist/` contents to `wildlife.nx3creations.com` hosting
2. Or create `wildlife` folder in existing hosting and upload there

### Option 4: GitHub Pages

1. Create repo `wildlife-book`
2. Push the `dist/` folder to `gh-pages` branch
3. Enable GitHub Pages

## Adding AI-Generated Images

When you have images, replace the emoji placeholders:

1. Add images to `public/images/`
2. Update continent markdown files to reference images
3. Update animal pages to show actual photos
4. Rebuild: `npm run build`

## Adding More Animals

1. Create new file in `src/content/animals/[animal-name].md`
2. Use this frontmatter template:

```yaml
---
name: Animal Name
scientificName: Scientific name
continent: Continent Name
status: Least Concern | Near Threatened | Vulnerable | Endangered | Critically Endangered
habitat: Habitat description
diet: Diet type
lifespan: Lifespan in years
weight: Weight range
---

# Animal Name

Content here...
```

3. Rebuild: `npm run build`

## Adding More Continents Content

Edit files in `src/content/continents/` — they're already set up for all 7.

## Development

```bash
cd /root/.openclaw/workspace/projects/wildlife-book/website
npm run dev      # Start dev server
npm run build    # Build for production
npm run preview  # Preview production build
```

## Current Status

✅ Site structure complete  
✅ 10 animals documented  
✅ All 7 continents with content  
✅ Responsive design  
✅ Static build working  
🔄 Ready for AI-generated images  
🔄 Ready for deployment  
