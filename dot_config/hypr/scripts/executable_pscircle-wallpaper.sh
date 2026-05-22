#!/bin/bash

# pscircle wallpaper updater script
# This script creates a composite wallpaper with pscircle overlay

# Configuration
WALLPAPER_DIR="$HOME/wallpapers"
CURRENT_WALLPAPER="$WALLPAPER_DIR/takeoff.png"  # Your base wallpaper
OUTPUT_DIR="/tmp"
PSCIRCLE_OUTPUT="$OUTPUT_DIR/pscircle_composite.png"
UPDATE_INTERVAL=30  # seconds
MONITOR_NAME="DP-3"  # Change to your monitor name (get with: hyprctl monitors)

# Create wallpaper directory if it doesn't exist
mkdir -p "$WALLPAPER_DIR"

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | systemd-cat -t pscircle-wallpaper
}

# Function to get current wallpaper from hyprpaper
get_current_wallpaper() {
    # Try to get current wallpaper from hyprpaper
    local current=$(hyprctl hyprpaper listloaded 2>/dev/null | head -1)
    if [[ -n "$current" && -f "$current" ]]; then
        echo "$current"
    else
        echo "$CURRENT_WALLPAPER"
    fi
}

# Function to detect monitor resolution
get_monitor_resolution() {
    local resolution=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$MONITOR_NAME\") | \"\(.width)x\(.height)\"" 2>/dev/null)
    if [[ -n "$resolution" && "$resolution" != "null" ]]; then
        echo "$resolution"
    else
        echo "1920x1080"  # fallback resolution
    fi
}

# Function to update wallpaper
update_wallpaper() {
    local base_wallpaper=$(get_current_wallpaper)
    local resolution=$(get_monitor_resolution)
    local width=$(echo "$resolution" | cut -d'x' -f1)
    local height=$(echo "$resolution" | cut -d'x' -f2)
    
    log "Updating wallpaper with resolution: ${resolution}"
    log "Base wallpaper: $base_wallpaper"
    
    # Generate pscircle with current wallpaper as background
    if pscircle \
        --background-image="$base_wallpaper" \
        --output="$PSCIRCLE_OUTPUT" \
        --output-width="$width" \
        --output-height="$height" \
        --tree-center="0:0" \
        --cpulist-center="$((width/4)):$((height/-4))" \
        --memlist-center="$((width/4)):$((height/4))" \
        --background-color="00000000" \
        --tree-font-size="16" \
        --toplists-font-size="14" \
        --dot-radius="4" \
        --tree-radius-increment="120" \
        --max-children="50" 2>/dev/null; then
        
        log "Generated pscircle successfully"
        
        # Set the composite image as wallpaper
        if hyprctl hyprpaper wallpaper "$MONITOR_NAME,$PSCIRCLE_OUTPUT" 2>/dev/null; then
            log "Wallpaper updated successfully"
        else
            log "Failed to set wallpaper via hyprpaper"
        fi
    else
        log "Failed to generate pscircle"
    fi
}

# Function to handle cleanup
cleanup() {
    log "Cleaning up and exiting..."
    [[ -f "$PSCIRCLE_OUTPUT" ]] && rm -f "$PSCIRCLE_OUTPUT"
    exit 0
}

# Set up signal handlers
trap cleanup SIGTERM SIGINT

# Main loop
log "Starting pscircle wallpaper updater"
log "Monitor: $MONITOR_NAME"
log "Update interval: ${UPDATE_INTERVAL}s"

# Initial update
update_wallpaper

# Continuous updates
while true; do
    sleep "$UPDATE_INTERVAL"
    update_wallpaper
done
