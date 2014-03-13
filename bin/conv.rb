#!/usr/bin/env ruby
require 'github/markdown'

Dir.chdir File.expand_path('../',__FILE__)
puts <<"HEADER"
<html>
  <head>
    <style>
      #{File.read("bootstrap.css")}
      #{File.read("github.css")}
    </style>
  </head>
  <body>
    <div class="container">
HEADER
STDOUT.write(GitHub::Markdown.to_html(ARGF.read, :gfm))
puts <<"FOOTER"
    </div>
  </body>
</html>
FOOTER
