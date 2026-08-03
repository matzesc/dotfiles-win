# emacs path
export PATH=$PATH:/c/emacs/29.2/bin/:$HOME/.config/emacs/bin/

# emacs alias

alias emacsd='emacs --daemon'
alias emacsdk='emacsclient -e "(kill-emacs)"'
alias emacsc='emacsclientw -a runemacs -c -f ~/.config/emacs/server/server'
#alias doom='~/.config/emacs/bin/doom'

# alias
#alias ls='ls -F --color'
alias grep='grep --color'
alias ll='ls -la'
#alias fzf='winpty fzf.exe'
alias fzfp="fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"

##############################################################################
# Autostart SSH agent
##############################################################################
ssh_env=~/.ssh/agent.env

agent_load_env () { test -f "$ssh_env" && . "$ssh_env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$ssh_env")
    . "$ssh_env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
#    ssh-add
#elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#    ssh-add
fi

unset ssh_env

# Function for adding all private keys to the SSH agent
# e.g. ssh-add-all ~/.ssh ~/.ssh/personal
ssh-add-all() {
    local dirs keys=()

    # Use provided directories, or default to ~/.ssh
    if [ $# -eq 0 ]; then
        dirs=(~/.ssh)
    else
        dirs=("$@")
    fi

    # Collect private keys from all specified directories
    for dir in "${dirs[@]}"; do
        while IFS= read -r -d '' pubkey; do
            local privkey="${pubkey%.pub}"
            if [ -f "$privkey" ]; then
                keys+=("$privkey")
            fi
        done < <(find "$dir" -name '*.pub' -print0 2>/dev/null)
    done

    if [ ${#keys[@]} -gt 0 ]; then
        echo "Adding the following keys:"
        printf '  %s\n' "${keys[@]}"
        ssh-add "${keys[@]}"
    else
        echo "No private keys found in: ${dirs[*]}"
    fi
}

# for SSH
#alias ssha='ssh-agent -t 24h > ~/.ssh/agent.env;source ~/.ssh/agent.env'
alias sshk='ssh-agent -k'
alias sshl='ssh-add-all ~/.ssh'
alias sshu='source ~/.ssh/agent.env'
##############################################################################

# dotfiles config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# set Editor variable
export EDITOR='cursor --wait'

# CHISIM server path
#alias chisim='cd //illis-eitfil02/fpga/maschmalisc'

# Modelsim/Questa environment variables
export MODEL_TECH_INI='/d/Mentor/simlibs/q2020.4_viv2021.2/modelsim.ini'

eval "$(fzf --bash)"
source 'C:\Users\MaSchmalisc\.bash_completions\open-webui.sh'

. "$HOME/.local/bin/env.sh"
