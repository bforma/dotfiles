require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 20000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

begin
  if require "awesome_print"
    AwesomePrint.irb!
  end
rescue => e
  puts "Could not load AwesomePrint:" + e.message
end
