" Vim ftplugin to find files and buffers similar to textmate.
" Maintainer:    Bruce Woodward <bruce.woodward@gmail.com>
" License:       Same license as vim
"
 
if exists("g:outline") || &cp
  finish
endif

let g:outline = 1

function! OutlineFoldLevel(lnum)
  let c = count(getline(a:lnum, "*"))
  return c == 0 ? "=" : ">".c
endfunction
 
function! OutlineFoldText()
  return getline(v:foldstart)
endfunction
 
setlocal foldmethod=expr foldexpr=OutlineFoldLevel(v:lnum)
" map tab to expand folds.
nmap <buffer> <tab> zo
" map shift-tab to close folds.
nmap <buffer> <s-tab> zc
" <Leader>s to search only headings.
nmap <buffer> <Leader>s /^\*\{1,\}<space>
nmap <buffer> <cr> :nohlsearch<cr>
setlocal nu ic incsearch foldtext=OutlineFoldText() hlsearch
