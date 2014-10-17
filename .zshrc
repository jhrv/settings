#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

GITHUB_USERNAME=jhrv
WORKSPACE=/Users/hrv/ws

alias ll='ls -latrhG'
alias macmini='ssh hrv@192.168.1.116'
alias pi='ssh pi@192.168.1.67'
alias ws='cd $WORKSPACE'
alias vim='mvim'
alias create-gitrepo='create_gitrepo' # creates git both a local and remote (github) repository
alias pzrc='push_zsh_rc'
alias sbrc='source ~/.bashrc'
alias ebrc='vim ~/.bashrc'
alias pvrc='push_vim_rc'
alias evrc='vim ~/.vimrc'
alias nav-wifi='/Users/hrv/sync/utils/wifi/wifi.sh'

init() {
    #export PS1="\u@\h:\W $ "
    osascript -e 'tell app "Finder" to quit'
    ZSH_THEME='clean'
}

create_gitrepo() {
    #TODO: should check if in a repo folder and if it already exists remotely?
    git init
    repo_name=`basename $PWD`
    curl -u $GITHUB_USERNAME https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
    git remote add origin git@github.com:$GITHUB_USERNAME/$repo_name.git
}

push_zsh_rc(){
    cd $WORKSPACE/settings
    cp -f ~/.zshrc .
    cp -f ~/.zpreztorc .
    git add .zshrc .zpreztorc
    git commit .zshrc .zpreztorc -m "chchchaaangeees"
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
