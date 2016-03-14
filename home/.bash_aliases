alias l="ls -lX --hide='*.pyc'"
alias xclip="xclip -selection c"
alias dir="pwd | tr -d '\n' | xclip"
alias git-gui="git-cola"
alias cloud="ssh root@162.242.211.236"
alias qa="ssh -A eslive@v2qa.energysage.com"
alias lspyc="find ./ -name \*.pyc -ls"
alias rmpyc="find ./ -name \*.pyc -exec rm {} \;"
alias work="cd ~/work && sh log_today"

alias utox="/opt/tox/utox"

# ---- Encrypted Directory ---- #
alias openvault="openssl enc -aes-256-cbc -d -in ~/vault.tar.gz.dat | tar xz; thunar ~/vault"
alias closevault="tar cz vault/ | openssl enc -aes-256-cbc -out ~/vault.tar.gz.dat; rm -r ~/vault"

alias work="cd /home/tom/work/ && ./log_today"

alias drive=drive-linux-amd64

alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(alert_helper)"'

export EMAIL="tom@energysage.com"
export NAME="Thomas Leo"


alias edit="vim -c 'cd $PWD'"

