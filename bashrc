# ~/.bash_profile

# __DotFilesDIR="$(dirname $0)"
__DotFilesDIR="$HOME/.dotfiles"


set +o nounset
stty erase '^?'

set -o vi

# some more ls aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lF'
alias la='ll -a'
alias lah='la -h'
alias lh='ll -h'
alias lt='la -t'
alias  l='ls'

# vim
alias vim='nvim -p'
alias  vi='nvim -p'
alias   v='nvim -p'
alias nvim='nvim -p'
export EDITOR='nvim'

# typo aliases
alias mdkir='mkdir'
alias sl='ls'

# convience aliases
alias cpwd='pwd | pbcopy'
alias gl='git log --oneline'
alias glo='git log --all --decorate --graph --oneline'
alias glm='git log --oneline --first-parent main'  # list directly commits on main
alias gdm='git diff origin/main...HEAD'
alias gdmf='git diff origin/main...HEAD --name-only | cat'
alias gss="git status -s"

# convience functions
mkc(){
    mkdir -p $1; cd $1
}
cdrt(){
    if ! git status > /dev/null; then
        return
    fi

    local rootdir=$(git rev-parse --show-superproject-working-tree)
    if [ -z "$rootdir" ]; then
        local rootdir=$(git rev-parse --show-toplevel)
    fi

    cd $rootdir
}

# prompt function
__branch_prompt(){
    local branch=$(git branch 2>/dev/null | awk '$1 == "*" {print $2}')
    local status=$(if [ -z "$(git status 2> /dev/null | grep 'nothing to commit')" ] ; then echo " x" ; fi)
    if [ -n "$branch" ]; then
        echo "($branch$status)"
    fi
}

# tmux color fix
# https://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode
alias tmux="TERM=screen-256color-bce tmux"

# determine system and source appropriate script
if [[ "$(uname)" == "Darwin" ]]; then
    source $__DotFilesDIR/systems/bash-macbook.sh
fi


if which exa > /dev/null 2>&1; then
    alias ls="exa --group-directories-first"
    alias ll="ls --icons  --long --header --git"
fi

if which bat > /dev/null 2>&1; then
    alias cat="bat --plain --paging=never"

    export MANPAGER="sh -c 'col -bx | bat -l man -p'"

    help() {
        "$@" --help 2>&1 | bat --plain --language=help
    }

    pydoc() {
        python -m pydoc "$@" 2>&1 | bat --plain --language=help
    }
fi

if which lazygit > /dev/null 2>&1; then
    alias lg="lazygit"
fi

if which rg > /dev/null ; then
    vg() {
        vim -q <(rg --line-number --column $@)
    }
fi

spython(){
    sudo $(which python) $@
}

spytest(){
    sudo $(which pytest) $@
}

sipython(){
    sudo $(which ipython) $@
}

export PATH="$HOME/.local/bin:$PATH"

[ -f venv/bin/activate ] && source venv/bin/activate
[ -f venv/Scripts/activate ] && source venv/Scripts/activate

[ -f ~/Programs/lua-language-server/3rd/luamake/luamake ] && alias luamake=$(realpath ~/Programs/lua-language-server/3rd/luamake/luamake)


if [[ -f ~/scripts/cw/cw.sh ]]; then
    cw() {
        source ~/scripts/cw/cw.sh $@
        if which starship > /dev/null ; then
            shell=$(basename $SHELL)
            eval "$(starship init $shell)"
        fi
    }
fi

[ -f ~/scripts/gitrepos/venv/bin/gitrepos ] && alias gitrepos="~/scripts/gitrepos/venv/bin/gitrepos"

if which starship > /dev/null ; then
    shell=$(basename $SHELL)
    eval "$(starship init $shell)"
fi


export PIPX_DEFAULT_PYTHON=python3.10
export VIRTUAL_ENV_DISABLE_PROMPT=1
