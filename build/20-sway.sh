#!/usr/bin/bash

set -eoux pipefail

###############################################################################
# Install Sway Window Manager and Essential Components
###############################################################################
# This script installs Sway window manager and related Wayland tools.
# It follows the @ublue-os/bluefin pattern for build scripts.
#
# Sway is a tiling Wayland compositor that is a drop-in replacement for i3.
# https://swaywm.org/
###############################################################################

echo "::group:: Install Sway Window Manager"

# Install Sway and core Wayland session components
dnf5 install -y \
    sway \
    swaybg \
    swayidle \
    swaylock

echo "Sway window manager installed"
echo "::endgroup::"

echo "::group:: Install Sway Utilities"

# Install essential Sway/Wayland utilities
dnf5 install -y \
    foot \
    waybar \
    wofi \
    mako \
    grim \
    slurp \
    wl-clipboard \
    xdg-desktop-portal-wlr

echo "Sway utilities installed"
echo "::endgroup::"

echo "::group:: Install Display Manager"

# Install SDDM as display manager (lightweight, works well with Sway)
dnf5 install -y sddm

# Enable the display manager
systemctl enable sddm

echo "Display manager configured"
echo "::endgroup::"

echo "::group:: Install Additional Wayland Tools"

# Install additional tools for a complete desktop experience
dnf5 install -y \
    brightnessctl \
    playerctl \
    polkit-gnome \
    xdg-user-dirs \
    flatpak

echo "Additional tools installed"
echo "::endgroup::"

echo "Sway window manager installation complete!"
echo "After booting, select 'Sway' session at the login screen"
