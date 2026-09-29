# dotfiles

One terminal workflow on macOS, Linux and Windows (WSL), managed with [chezmoi](https://www.chezmoi.io/):

- **[herdr](https://herdr.dev/)** runs every coding-agent session (Claude Code, Codex...) in persistent
  workspaces, tabs and panes, with a sidebar showing which agent is working, blocked or done.
- **WezTerm** (all platforms) or **Ghostty** (macOS / Linux) is the window around it, opening straight into herdr.
- **Omarchy themes** everywhere: 22 themes from [Omarchy](https://github.com/basecamp/omarchy) plus Dracula,
  applied to the terminal, herdr and Claude Code together. Default: Omarchy Dracula.

## Install

**macOS / Linux / inside WSL**

```bash
curl -fsSL https://raw.githubusercontent.com/somaliz/dotfiles/master/install.sh | bash
```

**Windows** (the terminal side: WezTerm config and colours, `.wslconfig`), in a normal PowerShell:

```powershell
iex (irm https://raw.githubusercontent.com/somaliz/dotfiles/master/install.ps1)
```

then run the Linux line above inside WSL. Both scripts show what would change and ask before applying.

Already have chezmoi? `chezmoi init somaliz && chezmoi diff && chezmoi apply`.

## What goes where

| | macOS | Linux desktop | WSL | Windows |
|---|:-:|:-:|:-:|:-:|
| herdr config `~/.config/herdr/config.toml` | ✓ | ✓ | ✓ | |
| WezTerm `~/.wezterm.lua` + `~/.config/wezterm/colors` | ✓ | ✓ | | ✓ |
| Ghostty `~/.config/ghostty` | ✓ | ✓ | | |
| Claude Code themes + statusLine | ✓ | ✓ | ✓ | |
| Shell PATH/aliases `~/.config/shell/common.sh` | ✓ | ✓ | ✓ | |
| `dots-theme` in `~/.local/bin` | ✓ | ✓ | ✓ | |
| `.wslconfig` | | | | ✓ |

The split lives in [`home/.chezmoiignore`](home/.chezmoiignore). Per-machine answers (the WSL distro name on
Windows) are asked once and kept in `~/.config/chezmoi/chezmoi.toml`, outside the repo.

**Deliberately not in this repo:** secrets, git identities, `~/.claude/settings.json` as a whole (only
`statusLine` and a default `theme` are set, by a script), and anything work- or machine-specific. Your
`~/.bashrc` / `~/.zshrc` stay yours: chezmoi only appends one line that sources `common.sh`.

## Daily use

```bash
dots-theme               # list themes, current one starred
dots-theme matte-black   # switch terminal + herdr + Claude Code (Claude: /theme or a new session)
chezmoi edit ~/.wezterm.lua && chezmoi apply    # change a managed file
chezmoi add ~/.some/config                      # start managing a new file
chezmoi update                                  # pull and apply on another machine
```

herdr keys (prefix `ctrl+q`, since Claude Code uses `ctrl+b`): `ctrl+q ?` lists every binding.
Split `ctrl+alt+d` / `ctrl+alt+shift+d`, move `ctrl+alt+h/j/k/l`, zoom `ctrl+alt+z`, new tab `ctrl+alt+c`,
next agent `ctrl+alt+a`, file viewer `ctrl+q f`, code review `ctrl+q shift+c`, detach `ctrl+q q`.
Sidebars: herdr spaces/agents `ctrl+q b`; file explorer + git `ctrl+q shift+b` or `ctrl+alt+b` (same key closes it).

## Adding another machine's setup

Add files from that machine with `chezmoi add`, and scope them in `.chezmoiignore` (or turn them into
`.tmpl` files branching on `.chezmoi.os` / `.chezmoi.hostname`) so they only land where they belong.

## Regenerating themes

```bash
git clone --depth 1 https://github.com/basecamp/omarchy /tmp/omarchy
python3 tools/omarchy-themes/omarchy_themes.py /tmp/omarchy
```

Extra themes in Omarchy's `colors.toml` format go in `tools/omarchy-themes/extra-themes/<name>/`.
Theme colours and templates are derived from Omarchy, MIT licensed: see
[`tools/omarchy-themes/LICENSE-omarchy`](tools/omarchy-themes/LICENSE-omarchy).
