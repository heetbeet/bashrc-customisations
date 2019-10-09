#*******************************************************
# Usual Path exports
#*******************************************************
export PATH=~/.bashrc-customisations:$PATH
export PATH=~/anaconda3/bin:$PATH
export PATH=~/Applications/jspaint:$PATH

#*******************************************************
#Custom clang
#*******************************************************
export PATH=~/Applications/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:$PATH
export LD_LIBRARY_PATH=~/Applications/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04/lib:$LD_LIBRARY_PATH

#*******************************************************
# Added functionalities
#*******************************************************
alias wifirestart="nmcli radio wifi off; sleep 7; nmcli radio wifi on"

#*******************************************************
# My custom git commands
#*******************************************************
alias git-myreset="git stash save --keep-index --include-untracked; git stash drop"

function git-mystash() {
    git stash push --include-untracked -m "mystash_$1"
}

function git-myapply() {
    git stash apply $(git stash list | grep "mystash_$1" | cut -d: -f1)
}

function git-mydrop() {
	git stash drop $(git stash list | grep "mystash_$1" | cut -d: -f1)
}
