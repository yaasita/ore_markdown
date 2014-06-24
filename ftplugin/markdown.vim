command! -nargs=? OreMarkdown call ore_markdown#conv("<args>")
let g:ore_markdown_fold = exists('g:ore_markdown_fold') ? g:ore_markdown_fold : 0
if g:ore_markdown_fold
    setlocal foldmethod=expr
    setlocal foldexpr=ore_markdown#fold()
endif
