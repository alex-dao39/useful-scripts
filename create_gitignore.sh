#!/bin/bash

# Check if at least one parameter is passed
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 param1 [param2 ... paramN]"
  exit 1
fi

# Join all parameters with commas
PARAMS=$(IFS=,; echo "$*")

# URL of the API
API_URL="https://www.toptal.com/developers/gitignore/api/$PARAMS"

# Fetch data from the API
response=$(curl -s $API_URL)

# Check if the response is not empty
if [[ -n "$response" ]]; then
  # Create or overwrite the .gitignore file with the fetched data
  echo "$response" > .gitignore
  echo ".gitignore file created successfully with parameters: $PARAMS."
else
  echo "Failed to fetch data from the API."
fi


