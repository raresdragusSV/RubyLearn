require_relative './bin/converter'

format = ARGV.shift
argument = ARGV.shift

converter = Converter.new(format, argument)
if converter.valid?
  converter.init
end
