#!/bin/bash
# Health check script for the application

URL="http://localhost:3000"
MAX_ATTEMPTS=30
ATTEMPT=0

echo "Waiting for application to be ready..."

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    if curl -f -s "$URL/health" > /dev/null; then
        echo " Application is healthy!"
        exit 0
    fi
    
    echo "⏳ Attempt $((ATTEMPT+1))/$MAX_ATTEMPTS - Application not ready yet..."
    sleep 2
    ATTEMPT=$((ATTEMPT+1))
done

echo " Application failed to become healthy within timeout"
exit 1