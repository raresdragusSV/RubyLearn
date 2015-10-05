require_relative './roman'
require_relative './arabic'
require_relative './newfile'
require_relative './print'

class Converter

  @@formats = ['-r', '-a' , '-f']

  attr_accessor :format, :argument

  def initialize(format)
    if Converter.valid?(format)
      @format = format
    end
  end

  def self.valid?(format)
    if !@@formats.include? format || format.nil?
      puts 'ERROR: The format is not present or unrecognized. Please use [-r, -a, -f]'
      return false
    else
      return true
    end
  end

  def convert_by_format(argument)
    case @format
    when @@formats[0]
      roman_num = RomanNumeral.new(argument)
      unless roman_num.roman.nil?
        arabic = roman_num.to_arabic
        Print.print_on_screen(arabic)
        return arabic
      end
    when @@formats[1]
      arabic = ArabicNumber.new(argument)
      unless arabic.number.nil?
        roman = arabic.to_roman
        Print.print_on_screen(roman)
        return roman
      end

    when @@formats[2]
      transform = []
      result = NewFile.read_file(argument)
      unless result.empty?
        result.each do |line|
          case line[0]
          when 'a'
            number = ArabicNumber.new(line[1])
            transform << "#{ line[1] } #{ number.to_roman }"
          when 'r'
            roman = RomanNumeral.new(line[1])
            transform << "#{ line[1] } #{ roman.to_arabic }"
          end
        end
        puts "The results are in 'result.out' file"
        Print.print_to_file('result.out', transform)
      end
    end
  end
end
