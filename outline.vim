
function! OrgFoldLevel(lnum)
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
  autocmd BufRead *.org setlocal foldmethod=expr foldexpr=OrgFoldLevel(v:lnum)
augroup END
