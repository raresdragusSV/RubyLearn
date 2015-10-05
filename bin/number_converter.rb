require_relative '../lib/converter.rb'

format = ARGV.shift
argument = ARGV.shift

converter = Converter.new(format)
converter.convert_by_format(argument)

