#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the path for the submodule within the main repository
SUBMODULE_PATH="binary-websocket-api"

# Create a temporary directory
TEMP_DIR=$(mktemp -d)

# Function to clean up the temporary directory on exit
cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Clone the bom-core repository into the temporary directory
git clone --depth 1 git@github.com:regentmarkets/bom-core.git "$TEMP_DIR/bom-core"

# Check if the binary-websocket-api directory exists in the cloned repository
if [ ! -d "$TEMP_DIR/bom-core/$SUBMODULE_PATH" ]; then
    echo "Directory $SUBMODULE_PATH does not exist in the bom-core repository. Aborting."
    exit 1
fi

# Remove existing submodule directory if necessary
if [ -d "$SUBMODULE_PATH" ]; then
    echo "Removing existing directory: $SUBMODULE_PATH"
    rm -rf "$SUBMODULE_PATH"
fi

# Copy the binary-websocket-api directory from the temporary directory to the current directory
cp -r "$TEMP_DIR/bom-core/$SUBMODULE_PATH" "$SUBMODULE_PATH"


echo "Submodule 'binary-websocket-api' successfully copied into the main repository."
