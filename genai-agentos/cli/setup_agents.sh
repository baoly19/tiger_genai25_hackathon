#!/bin/bash

# Save the current directory
cd agents
ROOT_DIR=$(pwd)

# Loop through each directory
for dir in */ ; do
  # Check if it's a directory
  if [ -d "$dir" ]; then
    echo "Processing directory: $dir"
    cd "$dir" || continue

    # Create virtual environment using uv
    uv venv

    # Activate virtual environment
    source .venv/bin/activate

    # Run uv sync
    uv sync

    # Deactivate and return to root
    deactivate
    cd "$ROOT_DIR"
  fi
done
