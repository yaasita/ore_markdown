let s:base_dir = expand('<sfile>:p:h')
function! ore_markdown#conv(...)
    if !exists('g:ore_markdown_output_file')
        let g:ore_markdown_output_file = "/tmp/preview.html"
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

    execute "!cd " . s:base_dir . "/../bin/ && bundle exec ./conv.rb --charset " . &fenc . " " . expand('%:p') . " " . args . " > " . g:ore_markdown_output_file ." 2>/dev/null" . bg
endfunction
