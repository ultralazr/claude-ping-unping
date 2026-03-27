# claude-ping-unping

Toggle random custom sound notifications on/off in Claude Code. Enable notifications with `/ping` to hear a random sound from your sound library whenever Claude finishes a task and is waiting for your input. Disable with `/unping`.

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
3. **Copy the hook script:**
   ```bash
   cp hooks/notify.ps1 ~/.claude/hooks/
   ```
4. **Merge the hook into your settings:**
   - Open `~/.claude/settings.json`
   - Merge the contents of `settings-snippet.json` into the `hooks` section

5. **Add sound files:**
   - Create `~/.claude/sounds/` directory
   - Add `.mp3` files (or other formats your OS supports)
   - Hook will pick a random file each time

## Usage

```
/ping     # Enable — sounds play when Claude finishes
/unping   # Disable — silence
```

## Cross-Platform

- **Windows**: Uses PowerShell Media Player (included script)
- **Mac/Linux**: Edit `hooks/notify.ps1` or create a bash alternative

## Add Your Own Sounds

Drop `.mp3` files into `~/.claude/sounds/` and they'll be used randomly:

```bash
mkdir -p ~/.claude/sounds
# Add your audio files here
```
