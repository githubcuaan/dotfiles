# Vi mode
bindkey -v
export KEYTIMEOUT=15
bindkey -M viins 'jk' vi-cmd-mode

# Cursor shape: Block in Normal, Line in Insert
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        echo -ne '\e[1 q'
    else
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select

function zle-line-init {
    zle-keymap-select
}
zle -N zle-line-init
