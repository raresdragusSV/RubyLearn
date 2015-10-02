require './lib/converter'

format = ARGV[0].dup
argument = ARGV[1].dup

converter = Converter.new(format, argument)
if converter.validation()
  result = converter.init
  converter.printing(result)
end
