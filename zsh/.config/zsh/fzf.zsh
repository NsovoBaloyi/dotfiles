# Sets up standard fzf key bindings (Ctrl+R, Ctrl+T, Alt+C) and completions
if [[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]]; then
    source /opt/homebrew/opt/fzf/shell/completion.zsh
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
elif [[ -f /usr/local/opt/fzf/shell/completion.zsh ]]; then
    source /usr/local/opt/fzf/shell/completion.zsh
    source /usr/local/opt/fzf/shell/key-bindings.zsh
fi

# Advanced fzf default visual theme and options
export FZF_DEFAULT_OPTS="
  --height 40% 
  --layout=reverse 
  --border 
  --inline-info
  --color=fg:-1,bg:-1,hl:#5f87af
  --color=fg+:#ffffff,bg+:#262626,hl+:#5fd7ff
  --color=info:#afaf87,prompt:#d75f00,pointer:#af5f00
  --color=marker:#87ff00,spinner:#af5f00,header:#87afaf"

# Use fzf for tab completion inside the Zsh shell natively
#if command -v fzf &> /dev/null; then
    # Hook fzf into the generic completion engine fallback
    #zstyle ':completion:*:_autocomplete:*' list-lines 10
#fi