FUNCNEST=100

eval "$(starship init zsh)"

setopt AUTO_CD # Automatically cd into a directory just by typing its path
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# Mass file renaming module tool
autoload -Uz zmv

# Directory Event Hook: Automatically list files whenever you 'cd'
#chpwd() {
    # Using 'emulate -L zsh' protects the function from outside alias interference
    #emulate -L zsh
    
    # Check if directory is readable, then list items elegantly 
    # (Using 'ls -F' adds trailing indicators like '/' for folders)
    #[[ -r . ]] && ls -F
#}