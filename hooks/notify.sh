#!/bin/bash

SOUNDS_DIR="$HOME/.claude/sounds"
if [ ! -d "$SOUNDS_DIR" ]; then
  exit 0
fi

# Get random sound file
SOUND=$(find "$SOUNDS_DIR" -maxdepth 1 \( -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" -o -name "*.m4a" \) -type f | shuf -n 1)
if [ -z "$SOUND" ]; then
  exit 0
fi

# Detect OS and play with appropriate player
OS=$(uname -s)
case "$OS" in
  Darwin)
    # macOS
    afplay "$SOUND" &
    ;;
  Linux)
    # Linux - try common players in order
    if command -v paplay &> /dev/null; then
      paplay "$SOUND" &
    elif command -v aplay &> /dev/null; then
      aplay "$SOUND" &
    elif command -v mpg123 &> /dev/null; then
      mpg123 -q "$SOUND" &
    fi
    ;;
  MINGW*|CYGWIN*|MSYS*)
    # Windows (Cygwin/MSYS/Git Bash)
    powershell -NoProfile -File "$HOME/.claude/hooks/notify.ps1" &
    ;;
  *)
    # Fallback - try paplay first, then afplay
    if command -v paplay &> /dev/null; then
      paplay "$SOUND" &
    elif command -v afplay &> /dev/null; then
      afplay "$SOUND" &
    fi
    ;;
esac

exit 0
