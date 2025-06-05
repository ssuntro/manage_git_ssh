#!/bin/bash

SSH_DIR="$HOME/.ssh"

# Function to list potential private key files
list_keys() {
    echo "Listing potential SSH private key files in $SSH_DIR:"
    # Find files that are not directories and do not end with .pub
    find "$SSH_DIR" -maxdepth 1 -type f ! -name "*.pub" -print | while read -r key_path; do
        key_name=$(basename "$key_path")
        echo "- $key_name"
    done
}

# Function to set GIT_SSH_COMMAND using a specific key
use_key() {
    key_name="$1"
    key_path="$SSH_DIR/$key_name"

    if [ -f "$key_path" ]; then
        # Set the GIT_SSH_COMMAND environment variable
        export GIT_SSH_COMMAND="ssh -i \"$key_path\""
        echo "GIT_SSH_COMMAND has been set to use key: '$key_name'"
        echo "Value: $GIT_SSH_COMMAND"
        echo ""
        echo "Note: For this change to affect your current terminal session,"
    else
        echo "Error: Key file '$key_name' not found in $SSH_DIR."
        list_keys # Show available keys if the specified one is not found
        exit 1 # Exit with an error code
    fi
}

# Main script logic
case "$1" in
    list)
        list_keys
        ;;
    use)
        if [ -z "$2" ]; then
            echo "Usage: $0 use <key_name>"
            list_keys
            exit 1 # Exit with an error code
        else
            use_key "$2"
        fi
        ;;
    *)
        echo "Usage: $0 <mode>"
        echo "Modes:"
        echo "  list - List available SSH key pairs."
        echo "  use <key_name> - Set GIT_SSH_COMMAND to use a specific key."
        exit 1
        ;;
esac

exit 0
