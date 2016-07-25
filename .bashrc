WORKSPACE=/Users/hrv/ws

alias ll='ls -latrhG'
alias ws='cd $WORKSPACE'
alias pbrc='push_bash_rc'
alias sbrc='source ~/.bashrc'
alias ebrc='vim ~/.bashrc'

init() {
    export PS1="\W $ "
}

push_bash_rc(){
	cd $WORKSPACE/settings
	git add .bashrc
	git commit .bashrc -m "chchchaaangeees"
	git push origin master
	cd -
}

push_vim_rc(){
	cd $WORKSPACE/settings
	git add .vimrc
	git commit .vimrc -m "chchchaaangeees"
	git push origin master
	cd -
}

init
