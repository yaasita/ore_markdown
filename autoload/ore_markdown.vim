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
		execute '!' . s:base_dir . '\..\bin\conv.bat --charset ' . &fenc . ' ' . args . ' ' . expand('%:p') . ' > ' . g:ore_markdown_output_file
	else
		execute "!cd " . s:base_dir . "/../bin/ && bundle exec ./conv.rb --charset " . &fenc . " " . expand('%:p') . " " . args . " > " . g:ore_markdown_output_file ." 2>/dev/null" . bg
	end
endfunction
