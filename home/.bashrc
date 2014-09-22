# My Aliases
alias l="ls -lX --hide='*.pyc'"
alias xclip="xclip -selection c"
alias dir="pwd | tr -d '\n' | xclip"
alias esenv="source /home/tom/energysage/ENV/bin/activate"
alias newenv="source /home/tom/energysage/NEW_ENV/bin/activate"
alias tomenv="source /home/tom/hacking/tomleo.com/ENV/bin/activate"
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

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:/opt/ActiveTcl-8.5/bin:$PATH"
#export EC2_KEYPAIR=tomleo # name only, not the file name
#export EC2_URL=ec2-54-213-78-65.us-west-2.compute.amazonaws.com
#export EC2_PRIVATE_KEY=$HOME/tomleo.pem
#export EC2_CERT=$HOME/<where your certificate is>/cert-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64/

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="/usr/local/tomleo/bin:$PATH"

alias cloud="ssh root@162.242.211.236"
alias python3="/opt/python3.4/bin/python3.4"
alias qa="ssh -A eslive@v2qa.energysage.com"

alias lspyc="find ./ -name \*.pyc -ls"
alias rmpyc="find ./ -name \*.pyc -exec rm {} \;"

export CLOJURESCRIPT_HOME=$PWD
