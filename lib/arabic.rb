require_relative 'roman_arabic'

class Arabic

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
