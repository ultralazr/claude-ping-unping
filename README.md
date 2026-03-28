![claude-ping-unping](assets/Relaxing%20with%20Claude%20and%20snacks.png)

# claude-ping-unping

Toggle random custom sound notifications on/off in Claude Code. Enable notifications with `/ping` to hear a random sound from your sound library whenever Claude finishes a task and is waiting for your input. Disable with `/unping`.

IMPORTANT: Works across all active sessions, but must be triggered from a session that was created after the new hook config.

## Features

- `/ping` — Enable notifications
- `/unping` — Disable notifications
- Plays a random `.mp3` from `~/.claude/sounds/`
- Persistent across sessions (flag-based toggle)

## Installation

1. **Clone/download this repo**
2. **Copy the skills:**
   ```bash
   cp -r skills/ping ~/.claude/skills/
   cp -r skills/unping ~/.claude/skills/
   ```
3. **Copy the hook scripts:**
   ```bash
   cp hooks/notify.sh ~/.claude/hooks/
   cp hooks/notify.ps1 ~/.claude/hooks/  # Windows fallback
   chmod +x ~/.claude/hooks/notify.sh
   ```
4. **Merge the hook into your settings:**
   - Open `~/.claude/settings.json`
   - Merge the contents of `settings-snippet.json` into the `hooks` section

5. **Add sound files:**
   - Create `~/.claude/sounds/` directory
   - Add audio files: `.mp3`, `.wav`, `.ogg`, `.m4a`
   - Hook will pick a random file each time

## System Requirements

**macOS:** Uses `afplay` (built-in)

**Linux:** Needs one of:
- `paplay` (PulseAudio)
- `aplay` (ALSA)
- `mpg123` (fallback)

Install on Ubuntu/Debian:
```bash
sudo apt-get install pulseaudio-utils  # for paplay
```

**Windows:** PowerShell with Media Player (built-in)

## Usage

```
/ping     # Enable — sounds play when Claude finishes
/unping   # Disable — silence
```

The flag state is checked at the moment the hook fires, so `/unping` takes effect immediately across all sessions.


## Add Your Own Sounds

Drop `.mp3` files into `~/.claude/sounds/` and they'll be used randomly:

```bash
mkdir -p ~/.claude/sounds
# Add your audio files here
```
