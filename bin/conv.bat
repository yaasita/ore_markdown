@echo off
cd /d %~dp0
bundle exec ruby conv.rb %*
