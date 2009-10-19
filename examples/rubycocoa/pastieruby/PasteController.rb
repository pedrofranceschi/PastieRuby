# RubyController

require 'osx/cocoa'
require "~/Desktop/ruby/pastieruby/lib/pastieruby"

class RubyController < OSX::NSObject

  ib_outlets :contentToPaste, :pasteResult, :spinner;
  
  ib_action :pasteIt do |sender|
    @spinner.startAnimation 0
    paste_url = pastie_text(@contentToPaste.stringValue, "plaintext", false)
    @pasteResult.stringValue = paste_url
    @spinner.stopAnimation 0
  end
  
  ib_action :copyToClipboard do |sender|
    system "echo '#{@pasteResult.stringValue}' | pbcopy"
  end
  
end
