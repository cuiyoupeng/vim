# Neovim configuration 

This is a neovim configuration for developing go and more.

## Quick Start

Make sure to use Neovim >= 0.4.0.

Install [nodejs](https://nodejs.org/en/download) >= 14.14.

Install [Vim-plug](https://github.com/junegunn/vim-plug).

Install [Go](https://go.dev/doc/install).

Then clone the repository.
```sh
mkdir -p $HOME/.config/nvim && cd $_

git clone git@github.com:cypj/neovim.git .
```

open neovim, run `:PlugInstall`, it will install the needed plugins.
then run `:CocInstall coc-go`, it will install coc-go extensions to use gopls.
then run `:GoInstallBinaries`, it will install all needed to go tools.


## Reference

* [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
* [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)

