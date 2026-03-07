// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://wildlife.nx3creations.com',
  base: '/',
  output: 'static',
  build: {
    format: 'directory'
  }
});
