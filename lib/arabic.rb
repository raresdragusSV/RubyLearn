require_relative 'roman_arabic'

class Arabic
  attr_accessor :arabic

  def initialize(arabic)
    @arabic = arabic
  end

  def convert(arabic)
    roman = ''
    RomanArabic::ROMANS.each do |key, value|
      (arabic / value).times do
        roman << key
        arabic -= value
      end
    end
    roman
  end

end
