require 'active_record'
require 'pg'
require_relative '../lib/converter.rb'

format = ARGV.shift
argument = ARGV.shift

converter = Convert.new(format)
converter.convert_by_format(argument)

