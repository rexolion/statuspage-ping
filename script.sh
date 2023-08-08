#!/bin/bash

# Define your variables
declare -A URL_COMPONENT_MAP
URL_COMPONENT_MAP["https://example1.com"]="component_id_1"
URL_COMPONENT_MAP["https://example2.com"]="component_id_2"
# Add more URL to component mappings as needed

STATUSPAGE_API_KEY="your_api_key"  # Your Statuspage API key
PAGE_ID="page_id"                  # Statuspage Page ID

# Loop infinitely and perform the actions every minute
while true; do
    for URL in "${!URL_COMPONENT_MAP[@]}"; do
        COMPONENT_ID="${URL_COMPONENT_MAP[$URL]}"

        # Ping the URL and store the response
        RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

        # Determine the status based on the HTTP response code
        if [ "$RESPONSE" -eq 200 ]; then
            STATUS="operational"
        else
            STATUS="major_outage"
        fi

        # Send status to Atlassian Statuspage API
        curl -X PATCH \
            -H "Authorization: OAuth $STATUSPAGE_API_KEY" \
            -H "Content-Type: application/json" \
            -d "{\"component\":{\"status\":\"$STATUS\"}}" \
            "https://api.statuspage.io/v1/pages/$PAGE_ID/components/$COMPONENT_ID.json"

        echo "Status for $URL (Component ID: $COMPONENT_ID) updated: $STATUS"
    done

    # Wait for 1 minute before the next iteration
    sleep 60
done
