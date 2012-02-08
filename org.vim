" Vim ftplugin to find files and buffers similar to textmate.
" Last Change:   2012 Feb 7th.
" Maintainer:    Bruce Woodward <bruce.woodward@gmail.com>
" License:       Same license as vim
"
 
" This code couldn't be compatible.
if exists("g:outline") || &cp
  finish
endif

let g:outline = 1

function! OutlineFoldLevel(lnum)
  let i = 0
  let line = getline(a:lnum)
  let l = strlen(line)
  " count the number of asterixes at the beginning of the line.
  while i < l
    if line[i] == '*'
      let i = i + 1
    else
      break
    endif
  endwhile
  if i == 0
    return "="
  else
    return ">".i
  endif
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
