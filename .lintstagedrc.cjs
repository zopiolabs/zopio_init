module.exports = {
  // TypeScript and JavaScript files
  '**/*.{js,jsx,ts,tsx}': [
    // Run Biome linter on staged files
    'npx @biomejs/biome lint'
  ],
  
  // JSON files
  '**/*.json': [
    // Format JSON files
    'npx @biomejs/biome format --write'
  ],
  
  // Markdown files
  '**/*.md': [
    // Format markdown files
    'npx @biomejs/biome format --write'
  ],
  
  // Package.json files - check for dependency issues
  '**/package.json': [
    () => 'echo "package.json modified - remember to run pnpm install"'
  ],
  
  // Prisma schema files
  '**/schema.prisma': [
    () => 'pnpm run -F database generate'
  ],
  
  // Run secret detection on all staged files (runs once, not per file)
  '**/*': () => 'node scripts/detect-secrets.cjs'
};