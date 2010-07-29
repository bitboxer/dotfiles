autocmd BufNewFile,BufRead *.cehtml
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=cehtml |
      \ else |
      \   setf cehtml |
      \ endif
