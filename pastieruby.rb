
# 
# PastieRuby
# by pH (Pedro Henrique Cavallieri Franceschi) - iBlogeek.com
# 2006-2009 (C)
#

require 'rubygems'
require 'mechanize'
require 'nokogiri'

def pastie_text(text_to_paste, language, isPrivate=bool)
  
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

def pastie_file(filepath)
  file = File.new(filepath, "r");
  file_content = String.new
    while (line = file.gets)
        file_content << line
    end
  file.close
  
  ext = File.extname(filepath)
  
  language = case ext
    when ".rb" then "ruby"
    when ".cpp" then "c++"
    when ".c" then "c"
    when ".html" then "html/erb/rails"  
    when ".txt" then "plaintext"
    else "plaintext"  
    # need to improve other languages here...
    # need a day with 36 hours :P
  end

  return pastie_text(file_content, language, false)
end
