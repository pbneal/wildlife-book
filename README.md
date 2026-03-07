# Wildlife Photography Book - Website

Astro-based static site for the wildlife photography book project.

## Structure

```
src/
├── layouts/           # Page layouts
│   └── Layout.astro   # Main site layout with nav/footer
├── pages/             # Route pages
│   ├── index.astro    # Homepage
│   ├── continents/    # Continent pages
│   │   └── africa.astro
│   └── animals/       # Individual animal pages
│       └── african-elephant.astro
├── styles/            # Global styles
│   └── global.css
└── content/           # Markdown content (future)
    ├── animals/
    └── continents/
```

## Development

```bash
npm install
npm run dev          # Start dev server
npm run build        # Build for production
```

## Deployment

Built files go to `dist/` directory. Deploy to Hostinger VPS at `/public_html/wildlife/`.

## Domain

wildlife.nx3creations.com
