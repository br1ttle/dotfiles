# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

lc () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999
setopt SHARE_HISTORY
setopt extended_glob
setopt cdablevars


# exports for interactive shells
export TERM=xterm-256color
# nvim as default editor
export EDITOR="/usr/bin/nvim"


# aliases
# clear command
alias "cl=clear"
# cse to unsw ssh
alias cse="ssh -Y z5362216@weill.cse.unsw.edu.au"
alias rpi="ssh -X alarm@192.168.1.125"
# displayplacer awk command to reso
alias "reso=displayplacer list | awk 'END{print}'"
#alias pty="cd '$HOME/Google Drive/2. - code/212. - vimwiki/2022' && find . -type f -name 'week*.md' | sort | sed 's/.\{3\}$//' | xargs -I {} pandoc {}.md -o {}.pdf && pdfunite week*.pdf year.pdf && rm week*.pdf && cd -"


alias ZZ=exit
alias v="/usr/bin/nvim"
alias vv="/usr/bin/nvim '$HOME/Documents/vimwiki/212.00 - cs/index.md'"
alias vvv="/usr/bin/nvim '$HOME/Documents/vimwiki/212.01 - pkm/index.md'"
alias vd="/usr/bin/nvim '$HOME/Documents/vimwiki/212.00 - cs/diary/diary.md'"
alias vvd="/usr/bin/nvim '$HOME/Documents/vimwiki/212.01 - pkm/diary/diary.md'"

alias aloc="locate -d $HOME/.local/var/db/locate.user.database"
alias sloc="locate -d /var/db/locate.database"

# music
alias npi="ncmpcpp -c ~/.config/ncmpcpp/config_rpi -b ~/.config/ncmpcpp/bindings"
alias nab="ncmpcpp -c ~/.config/ncmpcpp/config_abel -b ~/.config/ncmpcpp/bindings"

# configs
alias trc="v ~/.config/tmux/tmux.conf"
alias vrc="v ~/.config/nvim/init.lua"
alias zrc="v ~/.config/zsh/.zshrc"
alias lrc="v ~/.config/lf/lfrc"
alias krc="v ~/.config/karabiner/karabiner.json"
alias kirc="v ~/.config/kitty/kitty.conf"
alias mrc="v ~/.config/mutt/"

alias a="tmux a"
alias srs="drill-srs"
alias zhist="v ~/.config/zsh/.zsh_history"

# custom functions

## delete the last x lines of file 
dtail () {
	tail -n $1 "$2" | wc -c | xargs -I {} truncate "$2" -s -{}
}

## start a countdown in minutes using the termdown utility
tt () {
	termdown $((60*$1))
}

## mc make and change into a directory
mc () {
	mkdir "$@"
	cd "$@"
}


#source $ZSH/oh-my-zsh.sh


source ~/.config/zsh/.z_secret

# antigen (package manager)
source $HOME/.config/zsh/antigen.zsh
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
