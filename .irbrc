require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 20000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'awesome_print'
end

AwesomePrint.irb!
