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
alias pi='ssh pi@horvi.asuscomm.com'
alias pi_local='ssh pi@192.168.1.67'
alias pippi='ssh pi@192.168.1.174'
alias ws='cd $WORKSPACE'
alias create-gitrepo='create_gitrepo' # creates git both a local and remote (github) repository
alias pzrc='push_zsh_rc'
alias szrc='source ~/.zshrc'
alias ezrc='vim ~/.zshrc'
alias eprezto='vim ~/.zpreztorc'
alias pvrc='push_vim_rc'
alias evrc='vim ~/.vimrc'
alias wifi-nav='/Users/hrv/sync/utils/wifi/wifi.sh'
alias chrome='launch_in_chrome'
alias emacs='open -a /Applications/Emacs.app --args' 
alias emacs-debug='open -a /Applications/Emacs.app --args --debug-init'

init() {
    #export PS1="\u@\h:\W $ "
    osascript -e 'tell app "Finder" to quit'
    ZSH_THEME='clean'
    init_docker
}

launch_in_chrome(){
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --kiosk $1
}

init_docker(){
    if [ $(boot2docker status) = "running" ]; then
        $(boot2docker shellinit)
    fi
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
