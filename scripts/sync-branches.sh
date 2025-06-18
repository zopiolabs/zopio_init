#!/bin/bash
# Zopio Branch Synchronization Script
# This script helps synchronize branches following GitFlow

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_DIR=$(pwd)
DATE_SUFFIX=$(date +%Y%m%d-%H%M%S)

echo -e "${BLUE}🔄 Zopio Branch Synchronization Tool${NC}"
echo "======================================"

# Function to create backup tags
create_backups() {
    echo -e "\n${YELLOW}📦 Creating backup tags...${NC}"
    
    for branch in main develop staging; do
        tag_name="backup/${branch}-${DATE_SUFFIX}"
        echo -e "Creating backup tag: ${tag_name}"
        git tag "${tag_name}" "origin/${branch}"
    done
    
    echo -e "${GREEN}✓ Backup tags created locally${NC}"
    echo -e "To push tags: git push origin --tags"
}

# Function to check branch status
check_status() {
    echo -e "\n${YELLOW}📊 Checking branch synchronization status...${NC}"
    
    echo -e "\n${BLUE}Branch Relationships:${NC}"
    echo -n "develop vs main: "
    ahead=$(git rev-list --count origin/main..origin/develop)
    behind=$(git rev-list --count origin/develop..origin/main)
    echo -e "${GREEN}${ahead}${NC} ahead, ${RED}${behind}${NC} behind"
    
    echo -n "staging vs develop: "
    ahead=$(git rev-list --count origin/develop..origin/staging)
    behind=$(git rev-list --count origin/staging..origin/develop)
    echo -e "${GREEN}${ahead}${NC} ahead, ${RED}${behind}${NC} behind"
}

# Function to show sync commands
show_sync_commands() {
    echo -e "\n${YELLOW}📝 Sync Commands to Execute:${NC}"
    echo -e "\n${BLUE}Step 1: Sync main → develop${NC}"
    cat << 'EOF'
git checkout develop
git pull origin develop
git checkout -b sync/main-to-develop-$(date +%Y%m%d)
git merge origin/main -m "sync: merge main branch with upstream updates into develop"
git push origin sync/main-to-develop-$(date +%Y%m%d)
EOF

    echo -e "\n${BLUE}Step 2: Create PR for main → develop${NC}"
    echo "gh pr create --base develop --title \"sync: merge main into develop\""
    
    echo -e "\n${BLUE}Step 3: After PR is merged, sync develop → staging${NC}"
    cat << 'EOF'
git checkout staging
git pull origin staging
git checkout -b sync/develop-to-staging-$(date +%Y%m%d)
git merge origin/develop -m "sync: merge develop into staging"
git push origin sync/develop-to-staging-$(date +%Y%m%d)
EOF
}

# Function to verify sync completion
verify_sync() {
    echo -e "\n${YELLOW}🔍 Verifying synchronization...${NC}"
    
    # Check if develop has all commits from main
    behind=$(git rev-list --count origin/develop..origin/main)
    if [ "$behind" -eq 0 ]; then
        echo -e "${GREEN}✓ develop is fully synced with main${NC}"
    else
        echo -e "${RED}✗ develop is still ${behind} commits behind main${NC}"
    fi
    
    # Check if staging has all commits from develop
    behind=$(git rev-list --count origin/staging..origin/develop)
    if [ "$behind" -eq 0 ]; then
        echo -e "${GREEN}✓ staging is fully synced with develop${NC}"
    else
        echo -e "${RED}✗ staging is still ${behind} commits behind develop${NC}"
    fi
}

# Main menu
echo -e "\n${BLUE}Select an option:${NC}"
echo "1) Check current sync status"
echo "2) Create backup tags"
echo "3) Show sync commands"
echo "4) Verify sync completion"
echo "5) Full sync wizard (interactive)"
echo "6) Exit"

read -p "Enter your choice (1-6): " choice

case $choice in
    1)
        check_status
        ;;
    2)
        create_backups
        ;;
    3)
        show_sync_commands
        ;;
    4)
        verify_sync
        ;;
    5)
        echo -e "\n${YELLOW}🚀 Starting Full Sync Wizard${NC}"
        check_status
        
        read -p "Create backup tags? (y/n): " backup_choice
        if [[ $backup_choice == "y" ]]; then
            create_backups
        fi
        
        echo -e "\n${BLUE}Ready to start synchronization?${NC}"
        echo "This will show you the commands to run."
        read -p "Continue? (y/n): " continue_choice
        
        if [[ $continue_choice == "y" ]]; then
            show_sync_commands
            echo -e "\n${GREEN}✓ Commands displayed above. Execute them in order.${NC}"
        fi
        ;;
    6)
        echo -e "${GREEN}Goodbye!${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac

echo -e "\n${BLUE}Done!${NC}"