#!/usr/bin/env ruby
require 'github/markdown'
require 'optparse'

opt = OptionParser.new
@option = {}
opt.on('--reload') {|v| @option[:reload]=v }
opt.on('--utf8') {|v| @option[:utf8]=v }
opt.permute!(ARGV)

Dir.chdir File.expand_path('../',__FILE__)
puts <<"HEADER"
<html>
  <head>
  #{'<meta content="text/html" charset="UTF-8">' if @option[:utf8]}
  #{'<meta http-equiv="refresh" content="3" />' if @option[:reload]}
    <style>
      #{File.read("bootstrap.css")}
      #{File.read("github.css")}
    </style>
  </head>
  <body>
    <div class="container">
HEADER
puts (GitHub::Markdown.to_html(File.read(ARGV.pop), :gfm))
puts <<"FOOTER"
    </div>
  </body>
</html>
FOOTER
