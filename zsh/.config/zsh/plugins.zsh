# Determine the dynamic Homebrew installation path prefix
if command -v brew &>/dev/null; then
    BREW_SHARE_DIR="$(brew --prefix)/share"
else
    # Fallbacks for standard installation structures
    [[ -d "/opt/homebrew/share" ]] && BREW_SHARE_DIR="/opt/homebrew/share" || BREW_SHARE_DIR="/usr/local/share"
fi

# 1. Load zsh-autosuggestions
if [[ -f "$BREW_SHARE_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$BREW_SHARE_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
    # Customise the ghost text appearance to a subtle, dim grey color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
fi

# 2. Load zsh-syntax-highlighting
# CRITICAL: This plugin must always be loaded dead last in the config
if [[ -f "$BREW_SHARE_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$BREW_SHARE_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

#ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

#_zplugin_load() {
  #local plugin_path="${ZPLUGINDIR}/${2}"
  #if [[ ! -d "$plugin_path" ]]; then
    #mkdir -p "$ZPLUGINDIR"
    #echo "Installing ${2}..."
    #git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
    #  || { echo "ERROR: failed to install ${2}" >&2; return 1; }
  #fi
  #source "${plugin_path}/${2}.plugin.zsh"
#}

#zplugin-update() {
  #local dir
  #for dir in "${ZPLUGINDIR}"/*/; do
    #echo "Updating ${dir:t}..."
    #git -C "$dir" pull --ff-only
  #done
#}

#_zplugin_load zsh-users zsh-autosuggestions
#_zplugin_load zsh-users zsh-history-substring-search
#_zplugin_load jeffreytse zsh-vi-mode
#_zplugin_load zdharma-continuum fast-syntax-highlighting