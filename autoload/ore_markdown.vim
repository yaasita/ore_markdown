let s:base_dir = expand('<sfile>:p:h')
function! ore_markdown#conv(...)
    if !exists('g:ore_markdown_output_file')
        let g:ore_markdown_output_file = "/tmp/preview.html"
    endif
    if a:0 != 0 && a:1 == "reload"
        let reload="reload"
    else
        let reload=""
    endif
    execute "!cd " . s:base_dir . "/../bin/ && bundle exec ./conv.rb " . expand('%:p') . " " . reload . " > " . g:ore_markdown_output_file
endfunction
