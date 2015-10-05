require_relative 'roman'
require_relative 'arabic'

class ConverterError < Exception

end

class Converter

  @@formats = ['-r', '-a' ]

  attr_accessor :format, :argument

  def initialize(format, argument)
    @format = format
    @argument = argument
  end

  def validation
    raise 'The format is not valid' unless @@formats.include? @format || @format.nil?
    raise 'The argument is not present' if @argument.nil?
    case @format
    when @@formats[0]
      Converter.roman?(@argument)
    when @@formats[1]
      Converter.arabic?(@argument)
    end
  end

  def self.roman?(argument)
    if argument.size > 14 || argument.scan(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/).empty?
      raise 'The argument is not a valid roman number.'
    else
      true
    end
  end

  def self.arabic?(argument)
    if Converter.convert_number(argument) && Converter.convert_number(argument).between?(0, 4000)
      true
    else
      raise 'The argument is not a valid number or greater than 4000.'
    end
  end

  def self.convert_number(object)
    begin
      return Integer(object)
    rescue
      return nil
    end
  end

  def init
    case @format
    when @@formats[0]
      roman = Roman.new(@argument)
      result = roman.convert(@argument)
    when @@formats[1]
      arabic = Arabic.new(@argument)
      result = arabic.convert(Converter.convert_number(@argument))
    end
    return result
  end

  def printing(result)
    puts "The result is #{result}"
  end
end
