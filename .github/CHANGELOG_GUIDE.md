# Changelog Generation Guide

## Overview
This guide explains how the automated changelog generation works in the Zopio project.

## How It Works

### Automatic Triggers
The changelog is automatically generated when:
1. Code is merged to the `main` branch
2. Manual workflow dispatch is triggered

### Version Bumping Rules
Based on conventional commits:
- `feat:` commits → Minor version bump (0.x.0)
- `fix:` commits → Patch version bump (0.0.x)
- Breaking changes (with `!`) → Major version bump (x.0.0)

### Workflow Process
1. Analyzes commits since last release
2. Determines version bump based on commit types
3. Updates `package.json` version
4. Generates/updates `CHANGELOG.md`
5. Creates git tag (e.g., `v0.11.0`)
6. Creates GitHub release

## Troubleshooting

### Common Issues

#### Workflow Fails with "No Commits Found"
- **Cause**: No new conventional commits since last release
- **Solution**: Ensure your commits follow conventional format

#### Workflow Fails to Push
- **Cause**: Branch protection or permissions
- **Solution**: Check workflow has proper permissions

#### Version Not Bumping Correctly
- **Cause**: Incorrect commit message format
- **Solution**: Use proper conventional commit format

## Best Practices

1. **Always use conventional commits**:
   ```
   feat: add new feature
   fix: resolve bug
   docs: update documentation
   chore: routine maintenance
   ```

2. **Include breaking changes**:
   ```
   feat!: change API interface
   
   BREAKING CHANGE: Description of what changed
   ```

3. **Group related changes** in a single PR for cleaner changelog

## Manual Trigger

To manually trigger changelog generation:
1. Go to Actions → Generate Changelog
2. Click "Run workflow"
3. Select branch (usually `main`)
4. Click "Run workflow" button

## Configuration

The workflow uses:
- **Preset**: Angular (conventional-changelog)
- **Tag Prefix**: `v` (e.g., v1.0.0)
- **Output**: `CHANGELOG.md` in root
- **Bot**: zopio-bot for commits

## Related Files
- `.github/workflows/changelog.yml` - Workflow configuration
- `CHANGELOG.md` - Generated changelog
- `package.json` - Version tracking