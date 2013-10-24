GITHUB_USERNAME=jhrv
WORKSPACE=/Users/hrv/Documents/workspace

alias ll='ls -latrhG'
alias macmini='ssh hrv@192.168.1.116'
alias pi='ssh pi@192.168.1.67'
alias ws='cd $WORKSPACE'
alias create-gitrepo='create_gitrepo' # creates git both a local and remote (github) repository
alias pbrc='push_bash_rc'
alias sbrc='source ~/.bashrc'
alias ebrc='sub ~/.bashrc'
alias pvrc='push_vim_rc'
alias evrc='vim ~/.vimrc'


create_gitrepo() {
	#TODO: should check if in a repo folder and if it already exists remotely?
	git init
	repo_name=`basename $PWD`
	curl -u $GITHUB_USERNAME https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
	git remote add origin git@github.com:$GITHUB_USERNAME/$repo_name.git
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
