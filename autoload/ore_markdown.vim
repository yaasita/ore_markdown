vim: fdm=marker

let s:exec_bin = expand('<sfile>:p:h:h') . "/ore_markdown-go"

" マークダウン出力用
function! ore_markdown#conv(...) "{{{
    if !exists('g:ore_markdown_output_file')
        let g:ore_markdown_output_file = "preview.html"
    endif

    if a:1 == "presentation"
        let l:cmd = [ s:exec_bin,
                    \ '-in', expand('%:p'),
                    \ '-out', g:ore_markdown_output_file,
                    \ "presentation" ]
        call s:Exec_cmd(l:cmd)
    else
        let l:cmd = [ s:exec_bin,
                    \ '-in', expand('%:p'),
                    \ '-out', g:ore_markdown_output_file,
                    \ "markdown" ]
        call s:Exec_cmd(l:cmd)
    endif
endfunction "}}}
function! s:Exec_cmd(clist) "{{{
    let l:cmd = []
    for item in a:clist
        call add(l:cmd,shellescape(item))
    endfor
    let l:cmdline = join(l:cmd, " ")
    if exists('g:ore_markdown_debug')
        echomsg l:cmdline
    endif
    call system(l:cmdline)
endfunction "}}}

" 折り畳み用
function! ore_markdown#fold() "{{{
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
endfunction "}}}
function! s:head(lnum) "{{{
    return strlen(matchstr(getline(a:lnum), '^#*'))
endfunction "}}}
