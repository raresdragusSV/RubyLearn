require_relative './roman_symbols'

class ArabicNumber
  attr_accessor :arabic, :roman, :valid

  def initialize(arabic)
    @arabic = arabic
    if ArabicNumber.valid?(@arabic)
      @arabic = ArabicNumber.parse_number_string(@arabic)
      @valid = true
    else
      @valid = false
    end
  end

  def self.parse_number_string(object)
    begin
      return Integer(object)
    rescue
      return nil
    end
  end

  def self.valid?(arabic)
    if ArabicNumber.parse_number_string(arabic) && ArabicNumber.parse_number_string(arabic).between?(1, 4000)
      return true
    else
      return false
    end
  end

  def to_roman
    if @valid == true
      @roman = ''
      arabic = @arabic
      RomanSymbols::ROMAN_SYMBOLS.each do |key, value|
        (arabic / value).times do
          @roman << key
          arabic -= value
        end
      end
    else
      @roman = 'error'
    end
    return @roman
  end
end
