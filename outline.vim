" Vim plugin to find files and buffers similar to textmate.
" Last Change:	2012 Feb 6th.
" Maintainer:	Bruce Woodward <bruce.woodward@gmail.com>
" License:	Same license as vim
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

augroup org_mode
  autocmd!
  autocmd BufRead *.org setlocal foldmethod=expr foldexpr=OutlineFoldLevel(v:lnum)
augroup END
