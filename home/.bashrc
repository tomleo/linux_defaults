# My Aliases
alias l="ls -l"
alias xclip="xclip -selection c"
alias dir="pwd | tr -d '\n' | xclip"
alias esenv="source /home/tom/energysage/ENV/bin/activate"
alias git-gui="git-cola"

# append commands to the history
shopt -s histappend

# appends commands as they are executed
# so multiple terminals open are once will always have an up-to-date history
# commands are normally appended at the end of a session
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# increase number of commands stored in history
export HISTSIZE=8000
export HISTFILESIZE=8000
