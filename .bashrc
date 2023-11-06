# emacs path
export PATH=$PATH:/c/emacs/28.1/bin/:~/.config/emacs/bin/

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
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset ssh_env

# for SSH
#alias ssha='ssh-agent -t 24h > ~/.ssh/agent.env;source ~/.ssh/agent.env'
alias sshk='ssh-agent -k'
alias sshl='ssh-add;ssh-add -l'
alias sshu='source ~/.ssh/agent.env'
##############################################################################

# miniconda
alias cona='source /c/miniconda3/Scripts/activate'
alias cond='conda deactivate'

# dotfiles config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# CHISIM server path
alias chisim='cd //illis-eitfil02/fpga/maschmalisc'
