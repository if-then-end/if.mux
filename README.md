# if.mux

A tmux config. Self-locating, no environment variables, no plugin manager.

## Install

```bash
git clone https://github.com/if-then-end/if.mux.git ~/.config/tmux
~/.config/tmux/install.sh
```

`install.sh` clones the plugins listed in it. Rerun it to update them.

## Layout

```
.tmux.conf      entry point
configs/        key bindings, options
themes/         onedark
sh/             helper scripts
plugins/        cloned by install.sh, git-ignored
```

`.tmux.conf` resolves its own directory with `#{d:config_files}`, so the repo
works wherever it is cloned.

## Keys

Prefix is `C-b`. All default bindings are unbound first, so what follows is the
whole set.

| | |
|---|---|
| `C-h` `C-l` | previous / next window (no prefix) |
| `n` | new window |
| `q` `Q` | kill pane / window |
| `v` | copy mode |
| `/` | search |
| `f` | search by regex |
| `p` | paste |
| `b` | choose buffer |
| `d` | detach |
| `R` | reload config |

In copy mode: `v` select, `V` line, `C-v` block, `y` copy to clipboard, `o` open
file in nvim.

## Plugins

sensible, yank, urlview, cpu, battery, prefix-highlight, online-status,
better-mouse-mode.

## License

MIT
