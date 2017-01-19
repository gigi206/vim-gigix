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
    curl https://raw.githubusercontent.com/gigi206/vim-gigix/master/.vimrc &>/dev/null -L -o ~/.vimrc  && success "Sucessfully download .vimrc file" || error "Problem when downloading .vimrc file" "criticial"
}

verif_deps() {
    which curl &>/dev/null && success "curl is installed" || error "curl is needed for the installation of .vimrc file !" "critical"
    which git &>/dev/null && success "git is installed" || error "git is needed for the installation" "critical"
    which python &>/dev/null && success "python is installed" || error "Python is recommended for some modules"
    vim --version | egrep '\+python' &> /dev/null && success "VIM is compiled with python" || error "VIM is not compiled with python ! Some modules. Some modules will not work !"
    which ctags-exuberant &>/dev/null && success "ctags-exuberant is installed" || error "ctags-exuberant is recommended for some modules"
    which cmake &>/dev/null && success "cmake is installed" || error "cmake is recommended for some modules"
    which g++ &>/dev/null && success "g++ is installed" || error "g++ is recommended for some modules"
}

setup_neoBundle() {
    if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
        git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim &>/dev/null && success "NeoBundle installed successfully" || error "Problem with the NeoBundle installation !" "critical"
    fi
    msg "Now we installed plugins. This can take a long time..."
    sleep 10
    vim "+set nomore" "+NeoBundleInstall!" "+qall" && success "Updating / installing plugins using NeoBundle" || error "Problem when installation some modules !"
}

configure_gnome-terminal() {
    which dconf &>/dev/null && (
        #profiles_uuid=`dconf list /org/gnome/terminal/legacy/profiles:/ | egrep '^:' | sed 's@/@@g'`
        default_profile_uuid=`dconf read /org/gnome/terminal/legacy/profiles:/default | sed "s@'@@g"`
        default_profile_name=`dconf read /org/gnome/terminal/legacy/profiles:/:${default_profile_uuid}/visible-name  | sed "s@'@@g"`
        dconf write /org/gnome/terminal/legacy/profiles:/:${default_profile_uuid}/use-system-font false
        dconf write /org/gnome/terminal/legacy/profiles:/:${default_profile_uuid}/font "'Roboto Mono for Powerline 12'"

        ~/.vim/bundle/gnome-terminal-colors-solarized/install.sh --skip-dircolors -s dark -p $default_profile_name
        success "gnome-terminal (${default_profile_name} profile) is configured"
    )
}

verif_deps
get_vimrc
setup_neoBundle
configure_gnome-terminal
