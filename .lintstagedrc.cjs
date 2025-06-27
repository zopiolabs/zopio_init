module.exports = {
  // TypeScript and JavaScript files
  '**/*.{js,jsx,ts,tsx}': [
    // Run Biome linter
    'pnpm lint --changed-files',
    // Run TypeScript type checking on affected projects
    () => 'pnpm typecheck'
  ],
  
  // JSON files
  '**/*.json': [
    // Format JSON files
    'pnpm format --changed-files'
  ],
  
  // Markdown files
  '**/*.md': [
    // Format markdown files
    'pnpm format --changed-files'
  ],
  
  // Package.json files - check for dependency issues
  '**/package.json': [
    () => 'pnpm install --frozen-lockfile --dry-run'
  ],
  
  // Prisma schema files
  '**/schema.prisma': [
    () => 'pnpm run -F database generate'
  ],
  
  // Run secret detection on all staged files (runs once, not per file)
  '**/*': () => 'node scripts/detect-secrets.js'
};