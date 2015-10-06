require_relative './roman_arabic'

class RomanNumber

  attr_accessor :roman, :number

  def initialize(roman)
    if RomanNumber.valid?(roman)
      @roman = roman.upcase.dup
    end
  end

  def self.valid?(roman)
    roman = roman.upcase
    if (roman =~ /(^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})){1,14}$/) == 0
      return true
    else
      error = 'The argument is not a valid roman number.'
      puts 'ERROR: ' + error
      Crud.insert('error', roman, error)
      return false
    end
  end

  def to_arabic
    @number = 0
    until @roman.empty?
      RomanSymbols::ROMAN_SYMBOLS.each do |key, value|
        if @roman.start_with? key
          @number += value
          @roman.slice!(0,key.size)
          break
        end
      end
    end
    @number
  end
end
