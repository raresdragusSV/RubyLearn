require_relative './roman_symbols'

class RomanNumeral
  attr_accessor :roman, :arabic, :valid

  def initialize(roman)
    @roman = roman.upcase
    if RomanNumeral.valid?(@roman)
      @valid = true
    else
      @valid = false
    end
  end

  def self.valid?(roman)
    roman = roman.upcase
    if (roman =~ /(^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})){1,14}$/) == 0
      return true
    else
      return false
    end
  end

  def to_arabic
    if @valid == true
      @arabic  = 0
      roman = @roman
      until roman.empty?
        RomanSymbols::ROMAN_SYMBOLS.each do |key, value|
          if roman.start_with? key
            @arabic += value
            roman.slice!(0,key.size)
            break
          end
        end
      end
    else
      @arabic = 'error'
    end
    return @arabic
  end
end




