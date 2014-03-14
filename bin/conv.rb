#!/usr/bin/env ruby
require 'github/markdown'

Dir.chdir File.expand_path('../',__FILE__)
puts <<"HEADER"
<html>
  <head>
  #{'<meta http-equiv="refresh" content="3" />' if ARGV[1] == "reload"}
    <style>
      #{File.read("bootstrap.css")}
      #{File.read("github.css")}
    </style>
  </head>
  <body>
    <div class="container">
HEADER
puts (GitHub::Markdown.to_html(File.read(ARGV[0]), :gfm))
puts <<"FOOTER"
    </div>
  </body>
</html>
FOOTER
