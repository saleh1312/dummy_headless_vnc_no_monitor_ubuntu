#!/bin/bash
set -euo pipefail


echo "[install.sh] Running install/prepare.sh"
chmod +x ./install/prepare.sh
bash ./install/prepare.sh

echo "[install.sh] Running install/x11vnc_config.sh"
chmod +x ./install/x11vnc_config.sh
bash ./install/x11vnc_config.sh

echo "[install.sh] Running install/xorg_dummy_config.sh"
chmod +x ./install/xorg_dummy_config.sh
bash ./install/xorg_dummy_config.sh

echo "[install.sh] All install steps completed."
