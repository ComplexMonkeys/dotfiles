# load bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# utilize youtube video id playlists to play certain files with mpv
function mpv-playlist() {
    local l="$1"
    local f=$(dirname "$l" | sed 's/\.tux//')
    xargs -a "$l" -I {} find "$f" -name {} | mpv --playlist=-
}

# make mpv use .tux playlist files appropriately 
function mpv() {
    if [[ "${1##*.}" == "tux" ]]; then
        mpv-playlist "$@"
    else
        command mpv "$@"
    fi
}

# improve upon the basic bash ls utility
if ls --color -d . >/dev/null 2>&1; then
  export COLUMNS
  eval "$(dircolors)"
  function ls {
    command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
  }
fi

# exports
export HISTSIZE=50
export EDITOR="nvim"
export BC_ENV_ARGS="/home/user/.config/.bc"
export PATH="$PATH:/home/user/.local/bin"
export STEAM_COMPAT_DATA_PATH=/mnt/nvme0n1/SteamLibrary/steamapps/compatdata

# bash prompt
PS1='\[\e[38;5;45m\]\u\[\e[0m\][\[\e[38;5;45m\]\w\[\e[0m\]]> '
