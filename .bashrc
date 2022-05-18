# emacs path
export PATH=$PATH:/c/emacs/28.1/bin/:~/.config/emacs/bin/
# emacs alias
alias emacsd='emacs --daemon'
alias emacsc='emacsclientw -a runemacs -c -f ~/.config/emacs/.local/etc/server/server'
#alias doom='~/.config/emacs/bin/doom'

# alias
#alias ls='ls -F --color'
alias grep='grep --color'
alias ll='ls -la'
alias fzf='winpty fzf.exe'

# dotfiles config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# CHISIM server path
alias chisim='cd //illis-eitfil02/fpga/maschmalisc'
