let s:base_dir = expand('<sfile>:p:h')
function! ore_markdown#conv()
    execute ore_markdown#cmd()
endfunction

function! ore_markdown#cmd()
    if !exists('g:ore_markdown_output_file')
        let g:ore_markdown_output_file = "/tmp/preview.html"
    endif
    return "!cd " . s:base_dir . "/../bin/ && bundle exec ./conv.rb " . expand('%:p') . " > " . g:ore_markdown_output_file
endfunction
