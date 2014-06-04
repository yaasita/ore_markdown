#!/usr/bin/env ruby
require 'github/markdown'
require 'optparse'

opt = OptionParser.new
@option = {}
opt.on('--reload') {|v| @option[:reload]=v }
opt.on('--charset VAL') {|v| @option[:charset]=v}
opt.permute!(ARGV)

case @option[:charset]
when "utf-8"
  charset='<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
when "sjis","cp932"
  charset='<meta http-equiv="Content-Type" content="text/html; charset=shift_jis">'
when "euc-jp"
  charset='<meta http-equiv="Content-Type" content="text/html; charset=euc-jp">'
when "iso-2022-jp"
  charset='<meta http-equiv="Content-Type" content="text/html; charset=iso-2022-jp">'
end

Dir.chdir File.expand_path('../',__FILE__)
puts <<"HEADER"
<html>
  <head>
  #{charset}
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
