require './lib/converter'
# this file should be moved to /bin
# as per the project skeleton requirements
# should create other files/folders as well like .gemspec
format = ARGV.shift
argument = ARGV.shift
# try researching conventions on how to create ruby executable 'main' files
converter = Converter.new(format, argument)
if converter.validation()
  result = converter.init
  converter.printing_to_screen(result)
end
