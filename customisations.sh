#*******************************************************
# Path exports
#*******************************************************
function add-PATH(){
	export PATH="$1:$PATH"
}
function add-LD_LIBRARY_PATH(){
	export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH"
}

add-PATH ~/.bashrc-customisations
add-PATH ~/anaconda3/bin
add-PATH ~/Applications/jspaint
add-PATH ~/Applications/julia-*/bin
add-PATH ~/.julia/bin

#*******************************************************
#Custom clang
#*******************************************************
add-PATH ~/Applications/clang*/bin
add-LD_LIBRARY_PATH ~/Applications/clang*/lib

#*******************************************************
# Added functionalities
#*******************************************************
alias wifirestart="nmcli radio wifi off; sleep 7; nmcli radio wifi on"

#*******************************************************
# My custom git commands
#*******************************************************
alias git-unsafe-reset="git stash save --keep-index --include-untracked; git stash drop"

function git-named-stash() {
    git stash push --include-untracked -m "mystash_$1"
}

function git-named-stash-apply() {
    git stash apply $(git stash list | grep "mystash_$1" | cut -d: -f1)
}

function git-names-stash-drop() {
	git stash drop $(git stash list | grep "mystash_$1" | cut -d: -f1)
}
