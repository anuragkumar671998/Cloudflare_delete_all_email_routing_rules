#!/bin/bash

# ===================== CONFIG =====================
CF_API_TOKEN="PASTE_YOUR_REAL_API_TOKEN"
ZONE_ID="PASTE_YOUR_ZONE_ID"
# ==================================================

API="https://api.cloudflare.com/client/v4"

echo "🔍 Fetching Email Routing RULES (UI shows these as Custom addresses)..."

RESPONSE=$(curl -s \
  "$API/zones/$ZONE_ID/email/routing/rules" \
  -H "Authorization: Bearer $CF_API_TOKEN" \
  -H "Content-Type: application/json")

# Extract rule IDs (no jq required)
RULE_IDS=$(echo "$RESPONSE" | sed 's/{/\n{/g' | grep '"id"' | sed 's/.*"id":"\([^"]*\)".*/\1/')

if [[ -z "$RULE_IDS" ]]; then
  echo "❌ No routing rules found OR token permissions incorrect"
  exit 1
fi

COUNT=$(echo "$RULE_IDS" | wc -l)
echo "🧨 Found $COUNT routing rules. Deleting..."

for ID in $RULE_IDS; do
  echo "Deleting rule ID: $ID"
  curl -s -X DELETE \
    "$API/zones/$ZONE_ID/email/routing/rules/$ID" \
    -H "Authorization: Bearer $CF_API_TOKEN" \
    -H "Content-Type: application/json"
  echo
  sleep 0.3
done

echo "✅ ALL Email Routing rules (Custom addresses) deleted."
