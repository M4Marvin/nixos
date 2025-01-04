#!/bin/bash

# Rebuilding script for NixOS with flakes
CONFIG_DIR="/etc/nixos"

function usage() {
  echo "Usage: $0 [command]"
  echo "Commands:"
  echo "  switch   - Rebuild and switch to the new configuration"
  echo "  test     - Build and test the configuration without switching"
  echo "  dry-run  - Perform a dry run to check for errors"
  echo "  clean    - Clean up old generations"
  echo "  help     - Display this help message"
}

function rebuild() {
  local action=$1
  case $action in
    switch)
      echo "Rebuilding and switching to the new configuration..."
      sudo nixos-rebuild switch --flake "$CONFIG_DIR"
      ;;
    test)
      echo "Building and testing the configuration..."
      sudo nixos-rebuild test --flake "$CONFIG_DIR"
      ;;
    dry-run)
      echo "Performing a dry run to check for errors..."
      sudo nixos-rebuild build --flake "$CONFIG_DIR"
      ;;
    clean)
      echo "Cleaning up old generations..."
      sudo nix-collect-garbage -d
      ;;
    help|*)
      usage
      ;;
  esac
}

if [[ -z $1 ]]; then
  usage
else
  rebuild "$1"
fi
