#!/usr/bin/ruby -w

require 'mkmf'

if RUBY_VERSION =~ /1.8/ then
  $CPPFLAGS += " -DRUBY_18"
end

#dir_config('csv_parser')
create_makefile('csv_parser')
