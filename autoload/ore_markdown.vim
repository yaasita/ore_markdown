let s:base_dir = expand('<sfile>:p:h')
function! ore_markdown#conv(...)
    if !exists('g:ore_markdown_output_file')
		if has('win32')
			let g:ore_markdown_output_file = expand("~") . '\Desktop\preview.html'
		else
			let g:ore_markdown_output_file = "/tmp/preview.html"
		endif
    endif

    let args=""
    let bg=""
    let space=' '
    for a in split(a:1)
        echo a
        if a == "reload"
            let args = args . " --reload"
        endif
        if a == "bg"
            let bg = " &"
        endif
    endfor
	if has('win32')
		execute '!""' . s:base_dir . '\..\bin\conv.bat" --charset ' . &fenc . ' ' . args . ' "' . expand('%:p') . '" > "' . g:ore_markdown_output_file . '"'
	else
        " ex) 
        " !cd '/home/yamasita/.vim/bundle/ore_markdown/autoload/../bin/ 
        " &&
        " bundle exec ./conv.rb --charset utf-8 '
        " '/tmp/test.md'
        " --reload
        " > '/tmp/preview.html'
        " 2>/dev/null &
		execute 
                    \ '!cd ' . shellescape(s:base_dir . '/../bin/',1) . space .
                    \ "&&" . space .
                    \ "bundle exec ./conv.rb --charset " . &fenc . space .
                    \ shellescape(expand('%:p'),1) . space .
                    \ args . space .
                    \ "> " . shellescape(g:ore_markdown_output_file,1) . space .
                    \ "2>/dev/null" . bg
	end
endfunction
