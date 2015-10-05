require_relative 'roman_arabic'

class Roman

  attr_accessor :roman

  def initialize(roman)
    @roman = roman
  end

  def convert(roman)
    arabic = 0
    until roman.empty?
      RomanArabic::ROMANS.each { |key, value|
        if roman.start_with? key
          arabic += value
          roman.slice!(0,key.size)
          break
        end
      }
    end
    return arabic
  end
end
