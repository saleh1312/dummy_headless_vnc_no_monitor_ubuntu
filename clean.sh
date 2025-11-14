#!/bin/bash

# Display ID (default to :0 if not provided)
DISPLAY_ID="${1:-:0}"
DISPLAY_NUM="${DISPLAY_ID#:}"
VNC_PORT=$((5900 + DISPLAY_NUM))

echo "[destroy_display.sh] Cleaning up display: ${DISPLAY_ID} (number ${DISPLAY_NUM}), VNC port ${VNC_PORT}"

# Function to kill process by pattern safely
kill_by_pattern() {
    local pattern="$1"
    local pids
    pids=$(pgrep -f "$pattern" || true)
    if [[ -n "$pids" ]]; then
        echo "[destroy_display.sh] Killing processes matching '$pattern': $pids"
        sudo kill -9 $pids
    else
        echo "[destroy_display.sh] No processes found for '$pattern'"
    fi
}

# Kill x11vnc for this display
kill_by_pattern "x11vnc.*-rfbport $VNC_PORT"

# Kill XFCE (startxfce4)
kill_by_pattern "startxfce4"

# Kill Xorg for this display
kill_by_pattern "X.*${DISPLAY_ID}"

echo "[destroy_display.sh] Cleanup complete."
