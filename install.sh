#!/usr/bin/env bash

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "\33[32m[✔]\33[0m ${1}"
}

error() {
    msg "\33[31m[✘]\33[0m ${1}"
    [ "$2" == "critical" ] && msg "Critical error => program exit !" && exit 1
}

get_vimrc() {
    mkdir -p ~/.vim/bundle
    curl https://raw.githubusercontent.com/gigi206/vim-gigix/master/.vimrc &>/dev/null -L -o ~/.vimrc  && success "Sucessfully download .vimrc file" || error "Problem when downloading .vimrc file" "criticial"
}

verif_deps() {
    which curl &>/dev/null && success "curl is installed" || error "curl is needed for the installation of .vimrc file !" "critical"
    which git &>/dev/null && success "git is installed" || error "git is needed for the installation" "critical"
    which python &>/dev/null && success "python is installed" || error "Python is recommended for some modules"
    vi --version | egrep '\+python|\+python3' &> /dev/null && success "VIM is compiled with python" || error "VIM is not compiled with pytho ! Some modules. Some modules will not work !"
    which ctags-exuberant &>/dev/null && success "ctags-exuberant is installed" || error "ctags-exuberant is recommended for some modules"
    which cmake &>/dev/null && success "cmake is installed" || error "cmake is recommended for some modules"
    which g++ &>/dev/null && success "g++ is installed" || error "g++ is recommended for some modules"
}

setup_neoBundle() {
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim &>/dev/null && success "NeoBundle installed successfully" || error "Problem with the NeoBundle installation !" "critical"
    msg "Now we installed plugins. This can take a long time..."
    sleep 10
    vim "+set nomore" "+NeoBundleInstall!" "+qall" && success "Now updating/installing plugins using NeoBundle" || error "Problem when installation some modules !"
}

verif_deps
get_vimrc
setup_neoBundle
