#!/bin/bash

# Display ID (default to :0 if not provided)
DISPLAY_ID="${1:-:0}"

# Extract display number and calculate VNC port
DISPLAY_NUM="${DISPLAY_ID#:}"  # Remove ':' prefix
VNC_PORT=$((5900 + DISPLAY_NUM))

################################ start dummy Xorg server ###############################
# Start Xorg with dummy configuration

XORG_LOG_DIR="/tmp/xorg"
mkdir -p "${XORG_LOG_DIR}"
X_LOG="${XORG_LOG_DIR}/${DISPLAY_NUM}.log"

# Start Xorg with dummy configuration and redirect output to per-display log (background)
/usr/bin/X ${DISPLAY_ID} -config /etc/X11/xorg.conf > "${X_LOG}" 2>&1 &


############################### start xfce with dummy display ###############################
# Set display for dummy X server
export DISPLAY=${DISPLAY_ID}

# Allow local user to access X server
xhost +SI:localuser:$USER

# Start XFCE in background (non-blocking) with per-display log directory
# Ensure the log directory exists and write to /tmp/xfce/{DISPLAY_NUM}.log
XFCE_LOG_DIR="/tmp/xfce"
mkdir -p "${XFCE_LOG_DIR}"
XFCE_LOG="${XFCE_LOG_DIR}/${DISPLAY_NUM}.log"
startxfce4 > "${XFCE_LOG}" 2>&1 &


############################### start x11vnc server ###############################
X11VNC_LOG_DIR="/tmp/x11vnc"
mkdir -p "${X11VNC_LOG_DIR}"
X11VNC_LOG="${X11VNC_LOG_DIR}/${DISPLAY_NUM}.log"
x11vnc -shared -forever -nodpms -noxdamage -rfbport ${VNC_PORT} -display ${DISPLAY_ID} -bg -o "${X11VNC_LOG}" -rfbauth /home/$USER/.vnc/passwd


# Print final connection info for the user
echo ""
echo "VNC is listening on port: ${VNC_PORT}"
echo "Display ID: ${DISPLAY_ID}"
echo "X log: ${X_LOG}"
echo "XFCE log: ${XFCE_LOG}"
echo "x11vnc log: ${X11VNC_LOG}"


