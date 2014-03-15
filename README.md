俺のMarkdown
===============

## これは何？

編集中のMarkdownをHTMLに変換するよくあるやつ

## インストール

要ruby,bundler

    NeoBundle 'yaasita/ore_markdown', {
          \ 'build' : {
          \     'unix' : 'bundle install --gemfile ./bin/Gemfile'
          \    },
          \ }

## 使い方
    
    # 以下のコマンドで実行
    # デフォルトで/tmp/preview.htmlに出力
    :OreMarkdown

    # HTMLに<meta http-equiv="refresh" content="3" />をつける
    :OreMarkdown reload

    # バックグラウンド実行
    :OreMarkdown bg

## 設定

    # HTML出力先
    let g:ore_markdown_output_file = "/tmp/preview.html"

    # 書き込み時に自動変換(非同期)
    autocmd BufWritePost *.md silent! OreMarkdown bg

    # imadesyo.vimと連携
    autocmd Filetype markdown let b:imadesyo_command = "OreMarkdown"
