function! Ztask(...) range


  let l:to = a:1
  let l:content = a:2

  :redir => l:href
  :silent :execute a:firstline.",".a:lastline."Gbrowse!"
  :redir END

  echo l:to
  echo l:content
  echo l:href
  :echom system("zentao --account=liangkai --password= --to=".l:to." --host=http://zd-dragon.hd.com --project=5 --product=4 --module=334 --title='code review' --content='".l:href.l:content."'")


endfunction

command! -range -nargs=* Ztask <line1>,<line2>call Ztask(<f-args>)

