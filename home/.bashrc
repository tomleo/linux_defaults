# My Aliases
alias l="ls -l"
alias ghome="cd ~/Programming"
alias gclass="cd /home/tom/Programming/Class-Cloud/class_cloud"
alias buildthis='cmake --build . | grep -iE "error|warning"'
alias ginstall="sudo apt-get install"
alias genv="source /home/tom/Programming/Class-Cloud/ENV/bin/activate"
# append commands to the history
shopt -s histappend

# appends commands as they are executed
# so multiple terminals open are once will always have an up-to-date history
# commands are normally appended at the end of a session
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# increase number of commands stored in history
export HISTSIZE=8000
export HISTFILESIZE=8000
