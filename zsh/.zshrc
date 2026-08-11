# ==============================
# 1. History
# ==============================
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# History optimization options
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found during searches.
setopt HIST_SAVE_NO_DUPS       # Older duplicate lines are omitted when writing history file.
setopt HIST_IGNORE_ALL_DUPS    # Delete old duplicate command from history list when typing a new one.
setopt HIST_IGNORE_SPACE       # Do not record an entry starting with a space (useful for secrets).
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry.

# Shared history options
setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY           # Share history between all open terminal sessions concurrently.


# ==============================
# 2. Completion System (Autocomplete Menu)
# ==============================
mkdir -p "$HOME/.cache"
autoload -Uz compinit && compinit -d ~/.cache/zcompdump

# Core rules: Expand strings, complete commands, correct minor typos
zstyle ':completion:*' completer _expand _complete _ignored _approximate

# Use arrow keys to navigate the visual completion grid menu
zstyle ':completion:*' menu select

# Match lowercase to uppercase (Case-insensitive autocomplete)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

# Colorise the completion menu using your active terminal profile colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Organize menu items into explicitly labeled groups (Commands, Files, etc.)
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' format '%B--- Completing %d ---%b'
zstyle ':completion:*' auto-description 'specify: %d'

# Bottom scroll-bars for huge lists (shows item counts and percentages)
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: Current selection at %p%s

# Automatically watch for newly installed binaries/apps instantly
zstyle ':completion:*' rehash true

# Advanced interactive process menu when typing "kill <TAB>"
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Automatically select single match options without showing menu
setopt AUTO_MENU
setopt MENU_COMPLETE

# ==============================
# 3. Key Bindings
# ==============================

if [[ -f "$HOME/.config/zsh/bindings.zsh" ]]; then
    source "$HOME/.config/zsh/bindings.zsh"
fi

# ==============================
# 4. Prompt & Misc
# ==============================

if [[ -f "$HOME/.config/zsh/prompt.zsh" ]]; then
    source "$HOME/.config/zsh/prompt.zsh"
fi

# ==============================
# 5. Aliases
# ==============================

if [[ -f "$HOME/.config/zsh/aliases.zsh" ]]; then
    source "$HOME/.config/zsh/aliases.zsh"
fi

# ==============================
# 6. Fuzzy Finder (fzf)
# ==============================

if [[ -f "$HOME/.config/zsh/fzf.zsh" ]]; then
    source "$HOME/.config/zsh/fzf.zsh"
fi
# ==============================
# 7. Plugins
# ==============================

if [[ -f "$HOME/.config/zsh/plugins.zsh" ]]; then
    source "$HOME/.config/zsh/plugins.zsh"
fi
# ==============================
# 8. Other Custom stuff
# ==============================