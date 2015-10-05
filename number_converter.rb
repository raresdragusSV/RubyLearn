require './lib/converter'

format = ARGV.shift
argument = ARGV.shift

converter = Converter.new(format, argument)
if converter.validation()
  result = converter.init
  converter.printing_to_screen(result)
end
