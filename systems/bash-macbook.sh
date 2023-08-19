# macbook bashrc configurations

# bash specific
if [ $BASH_VERSION ]; then # hide message
    export BASH_SILENCE_DEPRECATION_WARNING=1
    # fzf
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    # prompt
    export PS1='\n\[$(tput bold)$(tput setaf 1)\]macbook:\[$(tput sgr0)\][\W]$(__branch_prompt)\$ '
fi

# ls alias for mac
alias ls='ls -G'

# neomutt
alias mutt='neomutt'

# PATH variable
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Programs/bin:$PATH"
export PATH="/Users/tjsmart/Programs/Orca/orca_4_2_1_macosx_openmpi314:$PATH"
# for clangd
export PATH="$PATH:/usr/local/opt/llvm/bin"
# for mysql
export PATH="/usr/local/mysql/bin:$PATH"

# # LIBRARY_PATH vairable
# export LIBRARY_PATH="/usr/local/Cellar/gsl/2.6/lib:$LIBRARY_PATH"

# variables
export WORK="$HOME/Work"
export PERSONAL="$HOME/Personal"
export GDRIVE="/Users/tjsmart/GoogleDrive/My_Drive"
export ESPRESSO_PSEUDO="$WORK/Pseudo"

# cd aliases
alias   cdp='cd $HOME/Programs'
alias  cdpp='cd $HOME/Programs/Ping-Group'
alias  cdpw='cd $HOME/Programs/Ping-Group/PW2PY'
alias  cddc='cd $HOME/Programs/Ping-Group/DefectConcentration'
alias   cdd='cd $HOME/Downloads'
alias  cdpe='cd $PERSONAL'
alias  cdss='cd $PERSONAL/Projects/sol-searching'
alias  cdpc='cd $PERSONAL/Programs/Cpp'
alias cdpcs='cd $PERSONAL/Programs/Cpp/SparkyEngine'
alias  cdml='cd $PERSONAL/Coursera/MachineLearning'
alias  cdpf='cd $PERSONAL/Finances/Stocks/PYFI'
alias  cdph='cd $PERSONAL/Finances/House'
alias  cdca='cd $PERSONAL/Programs/Cpp/Algorithms'
alias  cdaoc='cd $PERSONAL/Projects/aoc2021'
alias   cdw='cd $WORK'
alias   cdu='cd $WORK/UltraFastDynamics'
alias   cd2='cd $WORK/2DScreening'
alias   cdz='cd $HOME/Programs/Ping-Group/zfs-code'
alias   cdb='cd $WORK/h-BN'
alias  cdbv='cd $WORK/h-BN/2019-Various'
alias  cdti='cd $WORK/h-BN/2019-Various/TiBN'
alias  cdmo='cd $WORK/h-BN/2019-Various/MoBN'
alias  cdbg='cd $WORK/h-BN/2020-Glorious'
alias  cdvb='cd $WORK/h-BN/2020-Glorious/Charged/VB/Q-1'
alias  cdnb='cd $WORK/h-BN/2021-Nonrad'
alias  cdnv='cd $WORK/Diamond/NV'
alias  cdbf='cd $WORK/BiFeO3'
alias   cdl='cd $WORK/LLNL'
# alias   cdm='cd $WORK/LLNL/MSC'
alias  cdmc='cd $WORK/LLNL/MSC/CsPbBr3'
alias cdmcs='cd $WORK/LLNL/MSC/CsPbBr3/surface'
alias  cds3='cd $WORK/LLNL/MSC/CsPbBr3/surface/100_term1/S33'
alias cdmcc='cd $WORK/LLNL/MSC/CsPbBr3/carriers'
alias cdmcm='cd $WORK/LLNL/MSC/CsPbBr3/molecule'
alias  cdm2='cd $WORK/LLNL/MSC/2DPerovskite'
alias  cdmp='cd $WORK/LLNL/MSC/polaron'
alias   cdh='cd $WORK/Hematite'
alias  cdhc='cd $WORK/Hematite/2021-Concentration'
alias  cdhp='cd $WORK/Hematite/2020-Polaron'
alias  cdh2='cd $WORK/Hematite/2019-Cluster-Defects'
alias   cdn='cd $WORK/NonRad'
alias   cdg='cd $GDRIVE'

# application aliases
alias calc='open -a "Calculator"'
alias gimp='open -a "GIMP-2.10.app"'
alias chrome='open -a "Google Chrome"'
alias matlab='open -a "MATLAB_R2019b"'
alias mathematica='open -a "Mathematica"'
alias messages='open -a "Messages"'
alias excel='open -a "Microsoft Excel"'
alias powerpoint='open -a "Microsoft PowerPoint"'
alias word='open -a "Microsoft Word"'
alias notes='open -a "Notes"'
alias preview='open -a "Preview"'
alias vesta='open -a "VESTA"'
alias xcode='open -a "Xcode"'
alias iterm='open -a "iTerm"'
alias avog='open -a "Avogadro"'
alias photoshop='open -a "Adobe Photoshop 2021"'
alias jpn='jupyter-notebook'
alias rjpn='jupyter nbconvert --to notebook --inplace --execute'

# convience aliases
alias cpwd='pwd | pbcopy'
alias gl='git log --all --decorate --graph'
alias glo='gl --oneline'


# MacPorts Installer addition on 2020-01-27_at_10:50:09: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

######XCrySDen###########
export XCRYSDEN_TOPDIR=/opt/local/share/xcrysden-1.5.60
export XCRYSDEN_SCRATCH=/tmp

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
# export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"

# aliases for jt
alias jtd="jt -vim -t gruvboxd -f roboto -fs 12 -ofs 12 -cellw 90% -T"
alias jtl="jt -vim -f roboto -fs 12 -ofs 12 -cellw 90% -T"

# see: https://wiki.vifm.info/index.php/How_to_set_shell_working_directory_after_leaving_Vifm
# vicd()
vifm()
{
    # local dst="$(command vifm --choose-dir - "$@")"
    local dst="$(command vifm --choose-dir - ".")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}
