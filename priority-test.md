# Priority Label Test

This file tests priority label detection based on keywords in PR titles.

## Expected Behavior
- Title with "critical" → `priority: critical` label
- Title with "urgent" → `priority: critical` label  
- Title with "high priority" → `priority: high` label