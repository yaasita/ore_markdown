俺のMarkdown
===============

## これは何？

編集中のMarkdownをHTMLに変換するよくあるやつ

## インストール

### 1. 適当なパッケージマネージャーでインストール

    # vim-plugだとこんな感じ
    Plug 'yaasita/ore_markdown'

### 2. インストールしたディレクトリ直下にバイナリを置く

変換に[ore_markdown-go](https://github.com/yaasita/ore_markdown-go)が必要なので
バイナリを`ore_markdown-go`という名前で(windowsは`ore_markdown-go.exe`)置いて下さい

* Linux
    * 64bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/linux-amd64-ore_markdown-go
    * 32bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/linux-386-ore_markdown-go
* FreeBSD
    * 64bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/freebsd-amd64-ore_markdown-go
    * 32bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/freebsd-amd64-ore_markdown-go
* Windows
    * 64bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/windows-amd64-ore_markdown-go.exe
    * 32bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/windows-386-ore_markdown-go.exe
* macOS
    * 64bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/darwin-amd64-ore_markdown-go
    * 32bit: https://github.com/yaasita/ore_markdown-go/releases/download/v0.6/darwin-386-ore_markdown-go

例）

    #vim-plug + Linux 64bitの場合
    cd ~/.vim/plugged/ore_markdown/
    curl -Lo ore_markdown-go https://github.com/yaasita/ore_markdown-go/releases/download/v0.4/linux-amd64-ore_markdown-go
    chmod +x ore_markdown-go

## 使い方
    
    # 以下のコマンドで実行
    # デフォルトでカレントディレクトリのpreview.htmlに出力
    :OreMarkdown

    # プレゼンテーション用のスライドにする
    # 出力イメージ
    # https://github.com/yaasita/ore_markdown/wiki/presentation
    :OreMarkdown presentation

    # 画像はmarkdownのファイルからたどれる場所にあれば(markdownからの相対パス)
    # base64にしてHTML内に埋め込みます
    # 例)
    # ![pic](hoge.gif)

## 設定

    # HTML出力先
    let g:ore_markdown_output_file = "/tmp/preview.html"

    # HTML出力先(Windows)
    let g:ore_markdown_output_file = 'C:\temp\preview.html'

    # 折りたたみ有効
    let g:ore_markdown_fold = 1

    # 書き込み時に自動変換
    autocmd BufWritePost *.md silent! OreMarkdown

    # imadesyo.vimと連携
    autocmd Filetype markdown let b:imadesyo_command = "OreMarkdown"
