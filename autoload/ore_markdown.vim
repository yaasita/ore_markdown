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
    let charset=&fenc==""?&enc:&fenc
    let debug=0
    let stderr="2>/dev/null"
    for a in split(a:1)
        echo a
        if a == "reload"
            let args = args . " --reload"
        endif
        if a == "presentation"
            let args = args . " --presentation"
        endif
        if a == "bg"
            let bg = " &"
        endif
        if a == "debug"
            let debug=1
            let stderr=""
        endif
    endfor
	if has('win32')
		" ex)
		" !"
		" "C:\Users\yamasita\.vim\bundle\ore_markdown\autoload\..\bin\conv.bat" --charset cp932
		" --reload
		"  "C:\temp\hoge.md"
		"  > "C:\Users\yamasita\Desktop\preview.html"
		let save_shellslash = &shellslash
		set noshellslash
		execute
					\ '!"' .
					\ shellescape(s:base_dir . '\..\bin\conv.bat') . ' --charset ' . charset . space .
					\ args . space .
					\ shellescape(expand('%:p')) . space .
					\ '> ' . shellescape(g:ore_markdown_output_file) .
					\ '"'
		if save_shellslash
			set shellslash
		endif
	else
        " ex) 
        " !cd '/home/yamasita/.vim/bundle/ore_markdown/autoload/../bin/ 
        " &&
        " bundle exec ./conv.rb --charset utf-8 '
        " '/tmp/test.md'
        " --reload
        " > '/tmp/preview.html'
        " 2>/dev/null &
        if debug
            echo 
                        \ '!cd ' . shellescape(s:base_dir . '/../bin/',1) . space .
                        \ "&&" . space .
                        \ "bundle exec ./conv.rb --charset " . charset . space .
                        \ shellescape(expand('%:p'),1) . space .
                        \ args . space .
                        \ "> " . shellescape(g:ore_markdown_output_file,1) . space .
                        \ stderr . bg
            let l:input = input("何かキーを押してください")
        endif
		execute 
                    \ '!cd ' . shellescape(s:base_dir . '/../bin/',1) . space .
                    \ "&&" . space .
                    \ "bundle exec ./conv.rb --charset " . charset . space .
                    \ shellescape(expand('%:p'),1) . space .
                    \ args . space .
                    \ "> " . shellescape(g:ore_markdown_output_file,1) . space .
                    \ stderr . bg
	end
endfunction

function! ore_markdown#fold()
    if v:lnum == 1
        let s:level = 0
    endif
    let l:head = s:head(v:lnum)
    if l:head
        let s:level = l:head
        return ">" . l:head
    elseif getline(v:lnum + 2) =~ '^#' && s:head(v:lnum + 2) < s:level
        let s:level = s:head(v:lnum + 2)
        return "<" . (s:level +  1)
    endif
    return "=" 
endfunction
 
function! s:head(lnum)
    return strlen(matchstr(getline(a:lnum), '^#*'))
endfunction
