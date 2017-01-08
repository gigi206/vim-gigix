# vim-gigix
Plugins and customization for VIM.

Inspired by [spf13-vim](http://vim.spf13.com/).
  * More reactive
  * More fast to load

## Installation
```sh
curl https://raw.githubusercontent.com/gigi206/vim-gigix/master/install.sh -L -o - | sh
```
## Key mapping
  * `<F2>` for load [YouCompleteMe](#youcompleteme)
  * `<Tab>` for execute snippets ([ultisnips](#ultisnips) and [vim-snippets](#vim-snippets)) once plugin [YouCompleteMe](#youcompleteme) is loaded

## Modules
### vim-cursor
[vim-cursor](https://github.com/mmozuras/vim-cursor) go to previous position when opening a vim buffer.

### vim-colors-solarized
[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) is a vim theme.
![solarized dark](https://github.com/altercation/solarized/raw/master/img/solarized-vim.png)

### vim-airline
[vim-airline](https://github.com/vim-airline/vim-airline) is a color status/tabline bar.
![vim-airline](https://github.com/vim-airline/vim-airline/wiki/screenshots/demo.gif)

### vim-airline-themes
[vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) : themes for vim-airline.
![vim-airline luna](https://f.cloud.github.com/assets/1803997/855867/e94e5428-f530-11e2-8097-fccaa7fdfa66.gif)

### vim-indent-guides
[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) is a plugin for visually displaying indent levels in Vim.
![vim-ident-guides](http://i.imgur.com/7tMBl.png)

### auto-pairs
[auto-pairs](https://github.com/jiangmiao/auto-pairs) insert or delete brackets, parens, quotes in pair.

### vim-multiple-cursors
[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) is a multiple selection feature into Vim.
![vim-multiple-cursors](assets/example1.gif?raw=true)

### matchit.zip
[matchit.zip](http://www.vim.org/scripts/script.php?script_id=39) script allows you to configure % to match more than just single characters.

### vim-easy-align
[vim-easy-align](https://github.com/junegunn/vim-easy-align) is a simple, easy-to-use Vim alignment plugin.
![vim-easy-align](https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif)

### vim-easymotion
[vim-easymotion](https://github.com/easymotion/vim-easymotion) provides a much simpler way to use some motions in vim.
![vim-easymotion](https://f.cloud.github.com/assets/3797062/2039359/a8e938d6-899f-11e3-8789-60025ea83656.gif)

### vim-surround
[vim-surround](https://github.com/tpope/vim-surround)  is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

### vim-repeat
If you've ever tried using the `.` command after a plugin map, you were likely disappointed to discover it only repeated the last native command inside that map, rather than the map as a whole. That disappointment ends today. Repeat.vim remaps `.` in a way that plugins can tap into it. (Compatibility for [vim-surround](#vim-surround))

### wildfire.vim
[wildfire.vim](https://github.com/gcmt/wildfire.vim) can quickly select the closest text object among a group of candidates.
![wildfire.vim](https://raw.githubusercontent.com/gcmt/wildfire.vim/master/_assets/preview.gif)

### nerdcommenter
[nerdcommenter](https://github.com/scrooloose/nerdcommenter) can do comments for some filetype.

### syntastic
[syntastic](https://github.com/vim-syntastic/syntastic) is a syntax checking.
![syntastic](https://raw.githubusercontent.com/vim-syntastic/syntastic/master/_assets/screenshot_1.png)

### nerdtree
[nerdtree](https://github.com/scrooloose/nerdtree)allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.
![nerdtree](screenshot/nerdtree.jpg)

### vim-fugitive
[vim-fugitive](https://github.com/tpope/vim-fugitive) add git functionalities to Vim.

### vim-signify
[vim-signify](https://github.com/mhinz/vim-signify) uses signs to indicate added, modified and removed lines based on data of an underlying version control system.
![vim-signify](https://raw.githubusercontent.com/mhinz/vim-signify/master/pictures/signify-demo.gif)

### ctrlp.vim
[ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) is a full path fuzzy file, buffer, mru, tag, ... finder for Vim.
![ctrlp.vim](https://i.imgur.com/yIynr.png)

### rainbow
[rainbow](https://github.com/luochen1990/rainbow) help you read complex code by showing diff level of parentheses in diff color.
![rainbow html](https://raw.githubusercontent.com/luochen1990/rainbow/demo/html.png)

### HTML-AutoCloseTag
[HTML-AutoCloseTag](https://github.com/vim-scripts/HTML-AutoCloseTag) automatically closes HTML tag once you finish typing it with `>`.

### gundo.vim
[gundo.vim](https://github.com/sjl/gundo.vim) is Vim plugin to visualize your Vim undo tree.
![gundo.vim](http://farm5.static.flickr.com/4113/5093114605_ebc46d6494.jpg)

### tagbar
[tagbar](https://github.com/majutsushi/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. It does this by creating a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. This means that for example methods in C++ are displayed under the class they are defined in.
![tagbar](https://i.imgur.com/Sf9Ls2r.png)

### YouCompleteMe
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe) is a fast, as-you-type, fuzzy-search code completion engine for Vim.
![YouCompleteMe demo](http://i.imgur.com/0OP4ood.gif)

#### Requirements
  * for use : Vim compiled with `python`+ `python`
  * for compilation : `python` + `python-devel` + `cmake`+ `g++`+ `Exuberant Ctags`

#### Compilation
YCM has been compile with `./install.py`. If you want more see below :

1) If you want YCM with semantic support for C-family languages :
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

2) To simply compile with everything enabled, there's a `--all` flag.  So, to install with all language features, ensure `xbuild`, `go`, `tsserver`, `node`, `npm`, `rustc`, and `cargo` tools are installed and in your `PATH`, then simply run :
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
```
### vim-snippets
[vim-snippets](https://github.com/honza/vim-snippets) contains snippets files for various programming languages.

### ultisnips
[ultisnips](https://github.com/SirVer/ultisnips) is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
![GIF Demo](https://raw.github.com/SirVer/ultisnips/master/doc/demo.gif)

## Troubleshooting
Disable **cursorline** `:set cursorline!` if you have some lags.
