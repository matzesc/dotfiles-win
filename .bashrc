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

# for SSH
alias ssha='ssh-agent -t 24h > ~/ssh-agent.sh;source ~/ssh-agent.sh'
alias sshk='ssh-agent -k'
alias sshl='ssh-add ~/.ssh/id_rsa ~/.ssh/id_ed25519;ssh-add -l'

# miniconda
alias cona='source /c/miniconda3/Scripts/activate'
alias cond='conda deactivate'

# dotfiles config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
