#!/usr/bin/env bash
set -euo pipefail

# Keybinding runs this detached: HERDR_PANE_ID is unset and PWD is the config
# dir, so resolve the focused pane and its cwd from the session snapshot.
read -r root_pane CWD < <(herdr api snapshot | python3 -c "
import sys, json
s = json.load(sys.stdin)['result']['snapshot']
pid = s['focused_pane_id']
pane = next(p for p in s['panes'] if p['pane_id'] == pid)
print(pid, pane.get('foreground_cwd') or pane.get('cwd'))
")

# Split root pane right → agent pane (full-height right column)
agent_split=$(herdr pane split "$root_pane" --direction right --ratio 0.75 --cwd "$CWD" --no-focus)
agent_pane=$(echo "$agent_split" | python3 -c "import sys,json; print(json.load(sys.stdin)['result']['pane']['pane_id'])")

# Split root pane down → terminal below editor
herdr pane split "$root_pane" --direction down --cwd "$CWD" --no-focus --ratio 0.75

# Launch nvim in the top-left pane
herdr pane run "$root_pane" "nvim"

# Start Claude Code agent in the right pane
herdr agent start claude --kind claude --pane "$agent_pane"
