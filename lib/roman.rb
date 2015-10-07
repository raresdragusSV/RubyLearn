require_relative './roman_arabic'

class RomanNumber
  # file name should be indentic to class name
  # also RomanNumeral is a better name the RomanNumber

  attr_accessor :roman, :number

  def initialize(roman)
    if RomanNumber.valid?(roman)
      @roman = roman.upcase.dup
      # the assignment should happen regardless of validity, if no exception is
      # used
      # It should instead set a @valid instance variable to reflect validity
      # It could also store the error this way
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
      # validation should only handle the validation
      # the responsibility to adding it to the DB should be handled by another
      # class
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
          # doesn't this detroy the original number?
          break
        end
      end
    end
    @number
  end
end
