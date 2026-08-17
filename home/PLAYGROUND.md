# Terminal & Editor Playground

A hands-on training deck for **WezTerm** and **Neovim** hotkeys. Print it, keep it next to your keyboard, and run the drills. Muscle memory beats reading: every section ends with a drill you can repeat in under 2 minutes.

## The game plan

Repetition on a real task is what builds speed. Do not try to memorize the tables. Do the drills. Ten minutes a day for two weeks beats cramming.

- **Week 1** - WezTerm panes/tabs and Nvim motions. Everything you touch every hour.
- **Week 2** - Nvim leader commands (files, grep, git) and search/undo.
- **Week 3** - Speed drills: navigate a real repo without touching the mouse.

Mark a row `[x]` when you can do it without looking at the sheet.

---

## 1. WezTerm

Your config: rose-pine-moon theme, Hack Nerd Font, tab bar hidden when a single tab is open. Most bindings below are the **defaults** (we did not rebind them).

### 1.1 Tabs (one window, many terminals)

| Action | Keys |
|---|---|
| New tab | `Ctrl+Shift+T` |
| Close tab | `Ctrl+Shift+W` |
| Switch to tab 1-9 | `Ctrl+Shift+1` ... `Ctrl+Shift+9` |
| Next / previous tab | `Ctrl+Tab` / `Ctrl+Shift+Tab` |
| Move tab left / right | `Ctrl+Shift+PageUp` / `Ctrl+Shift+PageDown` |

> Note: with `hide_tab_bar_if_only_one_tab`, the bar only appears when you have 2+ tabs. `Ctrl+Shift+T` to open another and the bar appears.

**Drill 1.1 (1 min).** Open 5 tabs (`Ctrl+Shift+T` x4). Jump 1-2-3-4-5-4-3-2-1 using only `Ctrl+Shift+<n>`. Close them all with `Ctrl+Shift+W`.

### 1.2 Panes (split one tab)

| Action | Keys |
|---|---|
| Split vertical (left/right) | `Ctrl+Shift+Alt+"` |
| Split horizontal (top/bottom) | `Ctrl+Shift+Alt+%` |
| Move focus to a pane | `Ctrl+Shift+Arrow` |
| Resize focused pane | `Ctrl+Shift+Alt+Arrow` |
| Zoom / unzoom a pane | `Ctrl+Shift+Z` |

**Drill 1.2 (2 min).** Split vertical, then horizontal the right pane. You now have 3 panes. Move focus around in a circle with `Ctrl+Shift+arrows` 10 times. Zoom the bottom-right pane (`Ctrl+Shift+Z`), scroll around, unzoom. Close panes with `Ctrl+Shift+W`.

### 1.3 Copy & paste

| Action | Keys |
|---|---|
| Copy selection | `Ctrl+Shift+C` (or just select with mouse) |
| Paste | `Ctrl+Shift+V` |
| Search in scrollback | `Ctrl+Shift+F` |
| Quick select (click a word to copy it) | `Ctrl+Shift+Space` |
| Copy mode (vim-style selection) | `Ctrl+Shift+X` |

**Drill 1.3 (1 min).** Run `ls -la` in a tab. Search for "total" with `Ctrl+Shift+F`, quit with `Esc`. Select a filename with the mouse and hit `Ctrl+Shift+C`, then paste it into a command with `Ctrl+Shift+V`.

### 1.4 Window & font

| Action | Keys |
|---|---|
| New window | `Ctrl+Shift+N` |
| Increase / decrease font | `Ctrl+=` / `Ctrl+-` |
| Reset font size | `Ctrl+0` |
| Full screen | `Alt+Enter` |
| Reload config after editing wezterm.lua | `Ctrl+Shift+R` |
| Command palette | `Ctrl+Shift+P` |

**Drill 1.4 (30 sec).** Bump the font up two steps, down two, reset. Toggle full screen and back.

> **Pro tip:** after editing `~/.config/wezterm/wezterm.lua`, hit `Ctrl+Shift+R` instead of restarting. That is the fastest feedback loop you own.

---

## 2. Neovim

Leader key is **Space**. `which-key` pops up after you press it and shows every leader binding - use it as your in-editor cheat sheet.

### 2.1 The first five (custom bindings)

| Action | Keys |
|---|---|
| Save the file | `Esc` (yes, Escape saves) |
| Select all | `Ctrl+A` |
| Open file browser | `Space e` |
| Find files | `Space f` |
| Search text in project | `Space s` |

**Drill 2.1 (2 min).** Open nvim in your dotfiles repo. Hit `Esc` (saves). Press `Space f`, type `wezterm`, Enter. Edit a character, hit `Esc`. Now `Space e` to open the file browser, navigate with `h/j/k/l` or arrows, open a file. `Space s` and grep for `wezterm`.

### 2.2 Moving around (motions)

These are the defaults built into Vim - they are the foundation of everything.

| Action | Keys |
|---|---|
| Up / down / left / right | `k` / `j` / `h` / `l` |
| Jump to word / WORD | `w` `b` `e` / `W` `B` `E` |
| Jump to line start / end | `0` / `$` |
| Jump to first / last line | `gg` / `G` |
| Jump to line N | `<N>gg` (e.g. `42gg`) |
| Jump to matching bracket | `%` |
| Go to next / previous search | `n` / `N` |
| Center cursor on screen | `zz` |

**Drill 2.2 (2 min).** Open any file. From line 1, do `42gg`, `gg`, `G`, `$`, `0`, then `w` your way across 3 lines and `b` back. `zz` to recenter. Do this 3 times.

### 2.3 Editing (normal mode)

| Action | Keys |
|---|---|
| Insert before / after cursor | `i` / `a` |
| Insert at line start / end | `I` / `A` |
| Open line above / below | `O` / `o` |
| Change word / change to end of line | `cw` / `C` |
| Delete char / word / line | `x` / `dw` / `dd` |
| Delete and paste over | `dd`, then `p` |
| Undo / redo | `u` / `Ctrl+R` |
| Repeat last change | `.` |
| Yank line / paste | `yy` / `p` |
| Visual line / block mode | `V` / `Ctrl+V` |

**Drill 2.3 (3 min).** Open a scratch file. `yy` copy line 1, `p` paste it 5 times. `o` add a new line. `cw` change the first word. `.` repeats the change on the next word - do it across 4 words without touching `cw` again. `u` to undo 3 times, `Ctrl+R` to redo.

### 2.4 Buffers, grep, git

| Action | Keys |
|---|---|
| Switch buffers | `Space b` |
| Git (Neogit) | `Space g` |
| Go to definition | `gd` |
| File browser | `Space e` |

**Drill 2.4 (2 min).** Open 3 files. `Space b` to flip between them. `Space g` opens Neogit - look at the status view, then close with `q`. In a code file, put the cursor on a function name and hit `gd`.

### 2.5 Search

| Action | Keys |
|---|---|
| Search forward | `/pattern` |
| Search backward | `?pattern` |
| Project grep | `Space s` |
| Find files | `Space f` |

**Drill 2.5 (2 min).** `/scrolloff`, `n` `n` `n`, `N` `N`. Change one hit with `ciw` and a new word. `Space s`, type the new word, find it in the project.

---

## 3. Daily 10-minute warm-up

Do this every morning until it is boring.

1. WezTerm: open 3 tabs + a split (`Ctrl+Shift+T`, `Ctrl+Shift+Alt+"`). (1 min)
2. Jump tabs and panes for 1 minute with arrow keys. (1 min)
3. Nvim: `Space f`, open the biggest file you can find. (1 min)
4. Motions: `gg`, `G`, `42gg`, `$`, `0`, `zz` x3. (2 min)
5. Edits: `cw` + `.` across 10 words. (1 min)
6. Undo all of it with `u` (hold it). (30 sec)
7. `Space s` grep for something real in your codebase. (1 min)
8. `Esc` to save. Done. (30 sec)

---

## 4. Anti-stuck cheat sheet

When you are lost, in order:

1. `Esc` - never hurts; in nvim it saves.
2. `Space` - which-key shows every leader command.
3. `q` - closes most popups, pickers, Neogit, help.
4. `Ctrl+Shift+P` (WezTerm) - command palette.
5. `:q!` - quit nvim without saving, last resort.
6. `Ctrl+Shift+Z` (WezTerm) - if a pane swallowed your screen, unzoom it.

---

## 5. Tracker

| Skill | Wk 1 | Wk 2 | Wk 3 |
|---|---|---|---|
| WezTerm tabs | `[ ]` | `[ ]` | `[ ]` |
| WezTerm panes | `[ ]` | `[ ]` | `[ ]` |
| WezTerm copy/paste/search | `[ ]` | `[ ]` | `[ ]` |
| Nvim motions | `[ ]` | `[ ]` | `[ ]` |
| Nvim edits + undo | `[ ]` | `[ ]` | `[ ]` |
| Nvim leader (f/s/b/e/g) | `[ ]` | `[ ]` | `[ ]` |
| Nvim grep + gd | `[ ]` | `[ ]` | `[ ]` |

Tick a box only when you can execute that skill without looking at this sheet.

---

*Edit this file in nvim to practice: `nvim ~/.dotfiles/home/PLAYGROUND.md`*
