#!/usr/bin/env bash

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "\33[32m[✔]\33[0m ${1}"
}

error() {
    msg "\33[31m[✘]\33[0m ${1}"
    if [ "$2" == "critical" ]; then
        msg "Critical error => program exit !"
        exit 1
    else
        echo -n "Some modules will be disabled ! Do you want continue installation ? (Y/N) "
        read -n1 answer
        [ "$answer" != 'Y' ] && exit 1 || echo
    fi
}

get_vimrc() {
    mkdir -p ~/.vim/bundle
    curl https://raw.githubusercontent.com/gigi206/vim-gigix/master/.vimrc &>/dev/null -s -L -o ~/.vimrc  && success ".vimrc file is installed" || error "Problem when downloading .vimrc file" "criticial"
}

get_ctags-exuberant() {
    which ctags-exuberant &>/dev/null || echo -n "Do you want to install ctags-exuberant from vim-gigix ? (Y/N) " \
        && read -n1 answer \
        && [ "$answer" == 'Y'  ] && echo \
        && (
            [ ! -e ~/.vim/bin ] && mkdir -p ~/.vim/bin
            curl https://github.com/gigi206/vim-gigix/raw/master/bin/ctags-exuberant -s -L -o ~/.vim/bin/ctags-exuberant \
                && chmod +x ~/.vim/bin/ctags-exuberant \
                && success "ctags-exuberant is installed" \
                || error "failed to download ctags-exuberant"
        )
}

verif_deps() {
    which curl &>/dev/null && success "curl is installed" || error "curl is needed for the installation of .vimrc file !" "critical"
    which git &>/dev/null && success "git is installed" || error "git is needed for the installation" "critical"
    which python &>/dev/null && success "python is installed" || error "python is recommended for some modules"
    which python3 &>/dev/null && success "python3 is installed" || error "python3 is recommended for some modules"
    vim --version | egrep '\+python3' &> /dev/null && success "VIM is compiled with python3" || error "VIM is not compiled with python3 ! Some modules will not work !"
    which cmake &>/dev/null && success "cmake is installed" || error "cmake is recommended for compile some modules"
    which automake &>/dev/null && success "automake is installed" || error "automake is recommended for compile some modules"
    which gcc &>/dev/null && success "gcc is installed" || error "gcc is recommended for compile some modules"
    which g++ &>/dev/null && success "g++ is installed" || error "g++ is recommended for compile some modules"
    which python3-config &>/dev/null && success "python3-config is installed" || error "python3-devel is recommended for compile some modules"
}

setup_Dein() {
    if [ ! -e ~/.vim/bundle/repos/github.com/Shougo/dein.vim ]; then
        msg "Installing Dein..."
        sh <(curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.vim/bundle > /dev/null \
            && success "Dein is installed" \
            || error "Problem with the Dein installation !" "critical"
    fi
    msg "Now we install plugins. This can take a long time..."
    vim -c "try | call dein#update() | call dein#recache_runtimepath() | finally | qall! | endtry" -N -u ~/.vimrc -U NONE -i NONE -V1 -e -s && success "Installing plugins using Dein" || error "Problem with installing some modules !"
}

verif_deps
get_ctags-exuberant
get_vimrc
setup_Dein

success "vim-gigix is installed :)"
