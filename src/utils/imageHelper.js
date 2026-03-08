// utils/imageHelper.js
// Helper functions for handling image paths

/**
 * Get the best image path for an animal
 * Tries media.heroImage first, then falls back to /images/{slug}.jpg
 * Note: In Astro static builds, we can't dynamically check file existence,
 * so we rely on the media object or standard naming convention
 * 
 * @param {Object} animal - The animal object from animals.json
 * @param {string} type - 'hero' or 'image2' 
 * @returns {string} - The image path
 */
export function getAnimalImagePath(animal, type = 'hero') {
  if (!animal) return '';
  
  // Try media object first (preferred)
  if (animal.media) {
    if (type === 'hero' && animal.media.heroImage) {
      return animal.media.heroImage;
    }
    if (type === 'image2' && animal.media.image2) {
      return animal.media.image2;
    }
  }
  
  // Fallback to standard naming convention
  // The actual file extension (.jpg or .png) should match what's in animals.json
  return `/images/${animal.slug}.jpg`;
}

/**
 * Get video path for an animal
 * @param {Object} animal - The animal object
 * @returns {string} - The video path
 */
export function getAnimalVideoPath(animal) {
  if (!animal) return '';
  
  if (animal.media?.video) {
    return animal.media.video;
  }
  
  return `/videos/${animal.slug}.mp4`;
}

/**
 * Get continent hero image
 * @param {string} slug - Continent slug
 * @returns {string|null} - Image path or null
 */
export function getContinentHeroImage(slug) {
  const continentImages = {
    'africa': '/images/lion.jpg',
    // Add more as needed
  };
  
  return continentImages[slug] || null;
}
