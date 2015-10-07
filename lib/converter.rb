require_relative './roman'
require_relative './arabic'
require_relative './newfile'
require_relative './print'
require_relative './crud'
require_relative './argument'

# EXAMPLE CLASS STRUCTURE
# class Converter
#   attr_accessbie: format, input
#   #initialize
#   valid_format?
#   #convert_by_format
#      which returns an array of [RomanNumeral, Arabic, Roman, etc.]

class Convert
  # class name should be indentical to file name
  # the Converter should handle the conversions, used for converting one or the
  # other, input/output should be handled by another class

  @@formats = ['-r', '-a' , '-f', '--list', '-l']

  attr_accessor :format, :argument

  def initialize(format)
    if Convert.valid?(format)
      @format = format
    end
  end

  def self.valid?(format)
    # this should be named valid_format? to better reflect functionality
    if !@@formats.include? format || format.nil?
      puts 'ERROR: The format is not present or unrecognized. Please use [-r, -a, -f, --list, -l]'
      return false
    else
      return true
    end
  end

  def convert_by_format(argument)
    # method name is wrong if this handles other tasks as well beside conversion
    # when list or other arguments are passed, Converter class shold not be accessed
    case @format
    when @@formats[0]
      Argument.create_arabic(argument)
    when @@formats[1]
      Argument.create_roman(argument)
    when @@formats[2]
      Argument.create_file(argument)
    when @@formats[3]
      Argument.list_database(argument)
    when @@formats[4]
      Argument.sort(argument)
    end
  end
end
