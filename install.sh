#!/bin/bash
set -euo pipefail


echo "[install.sh] Running install/prepare.sh"
chmod +x ./install/prepare.sh
./install/prepare.sh

echo "[install.sh] Running install/x11vnc_config.sh"
chmod +x ./install/x11vnc_config.sh
./install/x11vnc_config.sh

echo "[install.sh] Running install/xorg_dummy_config.sh"
chmod +x ./install/xorg_dummy_config.sh
./install/xorg_dummy_config.sh

echo "[install.sh] All install steps completed."
