#!/usr/bin/ruby
require "../../lib/pastieruby"

puts "************************"
puts "* PASTIEPOSTER - MENU *"
puts "************************\n\n"

puts "1) Paste text"
puts "2) Paste a file"
menu = gets.chomp

if menu == "1"
  puts "Enter your text to paste: \n\n"
  text = gets.chomp
  url = pastie_text(text, "plaintext", false)
  puts "\n\nPastie URL: #{url}"
end

if menu == "2"
  puts "Enter the path to your file: "
  path = gets.chomp
  url = pastie_file(path)
  puts "\n\nPastie URL: #{url}"
end