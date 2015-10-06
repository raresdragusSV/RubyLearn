require_relative './roman'
require_relative './arabic'
require_relative './newfile'
require_relative './print'
require_relative './connection'

class Convert

  @@formats = ['-r', '-a' , '-f', '--list']

  attr_accessor :format, :argument

  def initialize(format)
    if Convert.valid?(format)
      @format = format
    end
  end

  def self.valid?(format)
    if !@@formats.include? format || format.nil?
      puts 'ERROR: The format is not present or unrecognized. Please use [-r, -a, -f, --list]'
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
        converter = Converter.new(input_type: 'roman', input: argument, result: arabic, converted_at: Time.current)
        converter.save
        Print.print_on_screen(arabic)
        return arabic
      end
    when @@formats[1]
      arabic = ArabicNumber.new(argument)
      unless arabic.number.nil?
        roman = arabic.to_roman
        converter = Converter.new(input_type: 'arabic', input: argument, result: roman, converted_at: Time.current)
        converter.save
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
            roman = number.to_roman
            transform << "#{ line[1] } #{ roman }"
            converter = Converter.new(input_type: 'arabic', input: line[1], result: roman, converted_at: Time.current)
            converter.save
          when 'r'
            roman = RomanNumeral.new(line[1])
            arabic = roman.to_arabic
            transform << "#{ line[1] } #{ arabic }"
            converter = Converter.new(input_type: 'roman', input: line[1], result: arabic, converted_at: Time.current)
            converter.save
          end
        end
        puts "The results are in 'result.out' file"
        Print.print_to_file('result.out', transform)
      end
    when @@formats[3]
      converters = Converter.all
      Print.print_on_screen_from_database(converters)
    end
  end
end
