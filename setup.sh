#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the source and target directories
SOURCE_DIR="schemas"
TARGET_DIR="lib/basic_api/generated"

# Remove the target directory if it exists
if [ -d "$TARGET_DIR" ]; then
    echo "Removing existing directory: $TARGET_DIR"
    rm -rf "$TARGET_DIR"
fi

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Create symlinks for the JSON files
find "$SOURCE_DIR" -type f \( -name 'receive.json' -o -name 'send.json' \) | while read -r file; do
    base=$(echo "$file" | sed "s|^$SOURCE_DIR/||")
    target="$TARGET_DIR/$(echo "$base" | tr '/' '_')"
    if [ ! -e "$target" ]; then
        ln -s "../../../$file" "$target"
        echo "Symlink created: $target -> $file"
    else
        echo "Symlink already exists: $target"
    fi
done

# Uncomment the following line if you want to copy manually added JSON files to the target directory if not already there
# cp -n lib/basic_api/manually/*.json "$TARGET_DIR"

# Generate lib/basic_api/generated/api.dart
ls "$TARGET_DIR" | grep '\.json$' | awk '{print "export \"" $0 ".dart\";"}' > "$TARGET_DIR/api.dart"
perl -pi -e 's/.json//g' "$TARGET_DIR/api.dart"

echo "api.dart generated at $TARGET_DIR/api.dart"
