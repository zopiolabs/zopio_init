#!/bin/bash

# Setup GitHub Labels Script
# This script creates/updates all labels defined in .github/labels.json

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}Error: GitHub CLI (gh) is not installed${NC}"
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo -e "${RED}Error: Not authenticated with GitHub${NC}"
    echo "Run: gh auth login"
    exit 1
fi

# Get repository info
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
echo -e "${GREEN}Setting up labels for repository: $REPO${NC}"

# Read labels from JSON file
LABELS_FILE=".github/labels.json"

if [ ! -f "$LABELS_FILE" ]; then
    echo -e "${RED}Error: $LABELS_FILE not found${NC}"
    exit 1
fi

# Function to create or update a label
create_or_update_label() {
    local name=$1
    local color=$2
    local description=$3
    
    # Check if label exists
    if gh label list --repo "$REPO" | grep -q "^$name"; then
        echo -e "${YELLOW}Updating label: $name${NC}"
        gh label edit "$name" --repo "$REPO" --color "$color" --description "$description" || true
    else
        echo -e "${GREEN}Creating label: $name${NC}"
        gh label create "$name" --repo "$REPO" --color "$color" --description "$description" || true
    fi
}

# Parse JSON and create labels
echo "Processing labels..."

# Read the JSON file and process each label
jq -c '.[]' "$LABELS_FILE" | while read -r label; do
    name=$(echo "$label" | jq -r '.name')
    color=$(echo "$label" | jq -r '.color')
    description=$(echo "$label" | jq -r '.description // ""')
    
    create_or_update_label "$name" "$color" "$description"
done

echo -e "${GREEN}✅ Label setup complete!${NC}"

# List all labels
echo -e "\n${GREEN}Current labels:${NC}"
gh label list --repo "$REPO"