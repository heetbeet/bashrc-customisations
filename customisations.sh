#*******************************************************
# Path exports
#*******************************************************
function add-PATH(){
	if [ $# -ne 0 ]; then
		export PATH="$1:$PATH"
	fi
}
function add-LD_LIBRARY_PATH(){
	export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH"
}

#*******************************************************
#Add to path
#*******************************************************
add-PATH ~/.bashrc-customisations
add-PATH ~/Applications/jspaint
add-PATH ~/Applications/julia-*/bin
add-PATH ~/Applications/sublime_text_3
add-PATH ~/.julia/bin
add-PATH ~/anaconda3/bin
add-PATH ~/Applications/cmake-*-Linux-*/bin
add-PATH ~/devel/ace_v3.0_linux86

#*******************************************************
#Custom clang
#*******************************************************
add-PATH ~/Applications/clang*/bin
add-LD_LIBRARY_PATH ~/Applications/clang*/lib

#*******************************************************
# Added functionalities
#*******************************************************
alias wifirestart="nmcli radio wifi off; sleep 7; nmcli radio wifi on"

alias opendefault="xdg-open"

function runseperate(){
	# Name:
	#       runseperate
	# 
	# Description:
	#       Run a program completely detatched/seperate from the current terminal
	#
	# Manual:
	#       $ runseperate firefox
	nohup "$@" > /dev/null 2>&1 &
}

function copypath(){
	# Name:
	#       copypath
	# 
	# Description:
	#       Execute this command from terminal to copy the current path to clipboard.
	#       You can paste the path in text editors or anyware you want using Ctrl + V.
	#
	# Manual:
	#       $ copypath
	#       Ctrl + V (anyware you want to paste)

	# pwd   -   Returns the current directory path
	# awk   -   Captures the output of pwd and trim the new line
	# xclip -   Copy the output of awk to the clipboard
	pwd | awk '{printf $0}' | xclip -selection clipboard
}

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

function git-named-stash-drop() {
	git stash drop $(git stash list | grep "mystash_$1" | cut -d: -f1)
}
