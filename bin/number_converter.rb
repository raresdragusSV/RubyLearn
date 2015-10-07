require 'active_record'
require 'pg'
require_relative '../lib/converter.rb'
argument = []
format = ARGV.shift
# as a general rule: run rubocop to see where standards where ignored
# see comments in ArgumentProcessor to reviwrite bin file
until ARGV.empty?
  argument << ARGV.shift
end

converter = Convert.new(format)
unless converter.format.nil?
  converter.convert_by_format(argument)
end

