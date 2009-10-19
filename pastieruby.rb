
# 
# PastieRuby
# by pH (Pedro Henrique Cavallieri Franceschi) - iBlogeek.com
# 2006-2009 (C)
#

require 'rubygems'
require 'mechanize'
require 'nokogiri'

def send_pastie(text_to_paste, language, isPrivate=bool)
  
  if isPrivate
    restricted = 1
  else
    restricted = 0
  end
  
  language_id = case language
    when "actionscript" then "2"
    when "c#" then "20"
    when "c" then "7"
    when "c++" then "7"
    when "css" then "8"
    when "diff" then "5"
    when "html/erb/rails" then "12"
    when "html/xml" then "11"
    when "java" then "9"
    when "javascript" then "10"
    when "objective c" then "1"
    when "objective c++" then "1"
    when "pascal" then "17"
    when "perl" then "18"
    when "php" then "15"
    when "text" then "6"
    when "plaintext" then "6"
    when "python" then "16"
    when "ruby" then "3"
    when "ruby on rails" then "4"
    when "shell script" then "13"
    when "sql" then "14"
    when "yaml" then "19"
  end 
  
  agent = WWW::Mechanize.new
  response = agent.post(
      "http://pastie.caboo.se/pastes/create/",
      {
           :'paste[restricted]' => restricted.to_s,
           :'paste[parser_id]' =>  language_id,
           :'paste[body]' =>  text_to_paste,
           :'paste[authorization]' => "burger",
           :'paste[authorization]' => "burger",
      }
  )
  html = Nokogiri::HTML(response.body.to_s)
  if isPrivate
    return_value = response.body { |fh| fh.find { |line| line =~ /wrap?key=/ } }
    puts return_value
  else
    return_value = html.xpath('//title').first.content.to_s
    return_value[0,1] = ""
    return_value[" - Pastie"] = ""
  end
  return "http://www.pastie.org/#{return_value}"
end

puts "Enter some text:"
text = gets.chomp

url = send_pastie(text, "ruby", true)

puts url