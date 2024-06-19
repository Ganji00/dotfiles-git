#!/bin/bash

BRIGHTNESS_FILE="/tmp/current_brightness"

case "$1" in
    save)
        # Save the current brightness to a file
        light -G > "$BRIGHTNESS_FILE"
        ;;
    dim)
        # Set brightness to 20%
        light -S 10
        ;;
    restore)
        # Restore brightness from the saved file
        if [ -f "$BRIGHTNESS_FILE" ]; then
            light -S $(cat "$BRIGHTNESS_FILE")
        else
            # Default to 80% if the file doesn't exist
            light -S 80
        fi
        ;;
    *)
        echo "Usage: $0 {save|dim|restore}"
        exit 1
        ;;
esac

