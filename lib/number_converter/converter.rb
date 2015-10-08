require_relative './arabic_number'
require_relative './roman_numeral'

class Converter
  attr_accessor :format, :input

   @@formats = ['-r', '-a']

  def initialize(format, input)
    if Converter.valid?(format)
      @format = format
      @input = input
    end
  end

  def self.valid?(format)
    if @@formats.include? format
      return true
    else
      return false
    end
  end

  def convert_by_format
    results = []
    if @format == '-r'
      roman_numeral = RomanNumeral.new(@input)
      arabic_number = roman_numeral.to_arabic
      if arabic_number == 'error'
        results = ['error', @input, 'ERROR: The input is not a valid roman numeral']
      else
        results = ['roman', @input, arabic_number]
      end
    elsif @format == '-a'
      arabic_number = ArabicNumber.new(@input)
      roman_numeral = arabic_number.to_roman
      if roman_numeral == 'error'
        results = ['error', @input, 'ERROR: The input is not a valid number, zero or bigger than 4000']
      else
        results = ['arabic', @input, roman_numeral]
      end
    end
    return results
  end
end
