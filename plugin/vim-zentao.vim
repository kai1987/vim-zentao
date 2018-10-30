function! Zbug(...) range


  let l:to = a:1
  let l:content = a:2

  :redir => l:href
  :silent :execute a:firstline.",".a:lastline."Gbrowse!"
  :redir END

  if has_key(g:zentao_user_map,l:to)
    let l:to = get(g:zentao_user_map,l:to)
  endif

  let l:content = "<p><a href=\"".l:href."\" target=\"_blank\">".l:href."</a></p><br/><p>".l:content."</p>"

  let l:cmd = "zentao --account=".g:zentao_account." --password=".g:zentao_password." --to=".l:to." --host=".g:zentao_host." --project=".g:zentao_project." --product=".g:zentao_product." --module=".g:zentao_module." --title=".g:zentao_review_title." --content='".l:content."'"
  echo l:cmd
  :echom system(l:cmd)


endfunction

command! -range -nargs=* Zbug <line1>,<line2>call Zbug(<f-args>)

