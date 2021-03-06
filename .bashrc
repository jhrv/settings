WORKSPACE=/Users/hrv/ws

alias ll='ls -latrhG'
alias ws='cd $WORKSPACE'
alias pbrc='push_bash_rc'
alias sbrc='source ~/.bashrc'
alias ebrc='vim ~/.bashrc'
alias emacs='edit_with_emacs'
alias e='edit_with_emacs'
alias tcplisten='lsof -iTCP -sTCP:LISTEN -P'
alias k='kubectl'
alias gaustadveien23='ssh gaustadveien23.no@ssh.gaustadveien23.no'

init() {
    export PS1="\W $ "
}

edit_with_emacs() {
	emacsclient $1 > /dev/null 2>&1 &
}

sleep_in(){
	echo "going to sleep in $1 seconds"
	sleep $1; pmset sleepnow
}

reset_wifi(){
	sudo ifconfig en0 down
	sudo ifconfig en0 up
}

push_bash_rc(){
	cd $WORKSPACE/settings
	git add .bashrc
	git commit .bashrc -m "chchchaaangeees"
	git push origin master
	cd -
}

init

# added by travis gem
[ -f /Users/hrv/.travis/travis.sh ] && source /Users/hrv/.travis/travis.sh
