# [[ -f $HOME/.bash_alias ]] && source $HOME/.bash_alias

code-remote () {
    echo "starting remote vs-code session for $1/$2"
    code --remote ssh-remote+$1 $2
}

ipl () {
    ipRegEx="^[0-9]{1,3}(\.[0-9]{1,3}){3}$"
    ipinfoAuth="b344e40c4592a2"
    if [[ $1 =~ $ipRegEx ]] || [[ -z $1 ]]; then
        curl -H "Authorization: Bearer $ipinfoAuth" https://ipinfo.io/$1
        ping -c 2 -W 20 "$1"
    else
        filteredDomain=$(echo $1 | awk 'BEGIN{FS=OFS=","} {sub("^([^/:]+://)?(www[.])?","",$1); sub("/.*","",$1)} 1')
        ip=$(host $filteredDomain | grep 'has address' | head -n 1 | awk '{print $NF}')
        curl -H "Authorization: Bearer $ipinfoAuth" https://ipinfo.io/$ip
		echo -e "\n"
        ping -c 2 -W 20 "$ip"
    fi
}
ssh-ag () {
		eval `ssh-agent -s`
        ssh-add $1
        }
alias c='clear'
alias update="screen -m bash -c 'sudo apt update; sudo apt upgrade -y; exec bash'"
alias reload='source ~/.bashrc'
alias nano='nano -w'
alias codi='code-insiders'

venv () {
	FILE=$(pwd)/venv/bin/activate
	if [ -f "$FILE" ]; then
		source venv/bin/activate
	else
		python3 -m venv $(pwd)/venv --upgrade-deps && source venv/bin/activate
	fi
}
webs () {
	python3 -m http.server
	}
## directory aliases ##
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias mkdir='mkdir -pv'
alias lt='ls --human-readable --size -1 -S --classify'
alias cpv='rsync -ah --info=progress2'
alias ipc='curl ipinfo.io'
alias du1='du -h -d 1'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias hg='history | grep $1'  

# handy short cuts #
alias h='history'
alias j='jobs -l'
alias wget='wget -c'

alias path='echo -e ${PATH//:/\\n}'
alias ports='sudo ss -tulp'

# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias swagreload='docker exec -it swag nginx -s reload'
alias swagtest='docker exec -it swag nginx -t' 

## Git Related Aliases  
### Basic info
alias gs='git status'
alias gb='git branch'
alias gr='git remote -v'
alias gc='git commit -m'
alias ga='git add'
alias grs='git restore'

## docker
alias dc='docker-compose'
alias dcs='docker compose'
alias dxe='docker exec -it'