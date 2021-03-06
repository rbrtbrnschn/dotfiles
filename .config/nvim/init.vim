" NeoVim Configuration - Robert Bornschein


call plug#begin('~/.vim/plugged')
	" Plugins
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'arcticicestudio/nord-vim'
	"Plug 'maxmellon/vim-jsx-pretty'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch':'release'}
	Plug 'folke/zen-mode.nvim'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'joukevandermaas/vim-ember-hbs'
call plug#end()

so ~/.config/nvim/keybinds/nerdtree.vim

if (has("termguicolors"))
	set termguicolors
endif

set path+=**
set relativenumber
set nocompatible
syntax enable
set number

colorscheme nord

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

let g:airline_powerline_fonts = 1
let g:airline_theme='nord'

set encoding=UTF-8
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
