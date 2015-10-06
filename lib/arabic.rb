require_relative './roman_arabic'
require_relative './connection'

class ArabicNumber

  attr_accessor :number, :roman

  def initialize(number)
    if ArabicNumber.valid?(number)
      @number = ArabicNumber.parse_number_string(number)
    end
  end

  def self.valid?(number)
    if ArabicNumber.parse_number_string(number) && ArabicNumber.parse_number_string(number).between?(1, 4000)
      return true
    else
      error = 'The argument is not a valid number or greater than 4000.'
      puts 'ERROR: ' + error
      Crud.insert('error', number, error)
      return false
    end
  end

  def self.parse_number_string(object)
    begin
      return Integer(object)
    rescue
      return nil
    end
  end

  def to_roman
    @roman = ''
    RomanSymbols::ROMAN_SYMBOLS.each do |key, value|
      (@number / value).times do
        @roman << key
        @number -= value
      end
    end
    @roman
  end
end
