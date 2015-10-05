require_relative 'roman_arabic'

class Arabic

  # it think both classes would be better with the following format
  # name: ArabicNumber (RomanNumeral)
  # initialize: it should handle validation
  # self.valid?(number): to handle validation
  # to_arabic and to_roman methods respectively
  # which also use memoization: store the result in an instance variable and
  #   return it when re-accessing the method, instead of re-converting

  def self.convert(arabic)
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
