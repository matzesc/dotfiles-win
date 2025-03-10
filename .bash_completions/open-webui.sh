_open_webui_completion() {
    local IFS=$'
'
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _OPEN_WEBUI_COMPLETE=complete_bash $1 ) )
    return 0
}

complete -o default -F _open_webui_completion open-webui