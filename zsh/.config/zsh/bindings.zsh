bindkey -e # Use emacs keybindings

bindkey '^[[H' beginning-of-line        # Home key (or Fn + Left Arrow)
bindkey '^[[F' end-of-line              # End key (or Fn + Right Arrow)
bindkey '^[[3~' delete-char             # Forward Delete key (Fn + Delete)

# Word Navigation 
bindkey "^[[1;5D" backward-word         # Ctrl + Left Arrow on macOS
bindkey "^[[1;5C" forward-word          # Ctrl + Left Arrow on macOS
# bindkey '^[^[[D' backward-word        # Alt + Left Arrow (Move word back)
# bindkey '^[^[[C' forward-word         # Alt + Right Arrow (Move word forward)

# Up/Down Arrow History Match (Fallback if fzf is not used for arrow lookups)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Magic Space expansion: Expands shortcuts like "!!" inline using spacebar
bindkey ' ' magic-space

# Git
bindkey -s '^Xgc' 'git commit -m ""\C-b'