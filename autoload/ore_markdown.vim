let s:base_dir = expand('<sfile>:p:h')
function! ore_markdown#conv(...)
    if !exists('g:ore_markdown_output_file')
        let g:ore_markdown_output_file = "/tmp/preview.html"
    endif

    let args=""
    let bg=""
    for a in a:000
        if a == "reload"
            let args = args . " reload"
        endif
        if a == "bg" 
            let bg = " &"
        endif
    endfor

    execute "!cd " . s:base_dir . "/../bin/ && bundle exec ./conv.rb " . expand('%:p') . " " . args . " > " . g:ore_markdown_output_file . bg
endfunction
