俺のMarkdown
===============

## これは何？

編集中のMarkdownをHTMLに変換するよくあるやつ

## インストール

要ruby,bundler

    NeoBundle 'yaasita/ore_markdown', {
          \ 'build' : {
          \     'windows' : 'bundle install --gemfile .\bin\Gemfile',
          \     'mac' : 'bundle install --gemfile ./bin/Gemfile',
          \     'unix' : 'bundle install --gemfile ./bin/Gemfile'
          \    },
          \ }

## 使い方
    
    # 以下のコマンドで実行
    # デフォルトで/tmp/preview.htmlに出力(WindowsはDesktop)
    :OreMarkdown

    # HTMLに<meta http-equiv="refresh" content="3" />をつける
    :OreMarkdown reload

    # バックグラウンド実行(Windowsは効果なし)
    :OreMarkdown bg

    # プレゼンテーション用のスライドにする
    # 出力イメージ
    # https://github.com/yaasita/ore_markdown/wiki/presentation
    :OreMarkdown presentation

    # 引数は複数指定可 順不同
    :OreMarkdown bg reload

## 設定

    # HTML出力先
    let g:ore_markdown_output_file = "/tmp/preview.html"

    # HTML出力先(Windows)
    let g:ore_markdown_output_file = 'C:\temp\preview.html'

    # 折りたたみ有効
    let g:ore_markdown_fold = 1

    # 書き込み時に自動変換(非同期)
    autocmd BufWritePost *.md silent! OreMarkdown bg

    # imadesyo.vimと連携
    autocmd Filetype markdown let b:imadesyo_command = "OreMarkdown"
