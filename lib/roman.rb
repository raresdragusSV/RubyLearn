class Roman
  ROMANS = {
    'M'   => 1000,
    'CM'  => 900,
    'D'   => 500,
    'CD'  => 400,
    'C'   => 100,
    'XC'  => 90,
    'L'   => 50,
    'XL'  => 40,
    'X'   => 10,
    'IX'  => 9,
    'V'   => 5,
    'IV'  => 4,
    'I'   => 1
  }
  attr_accessor :roman

  def initialize(roman)
    @roman = roman
  end

  def convert
    roman = @roman
    arabic = 0
    until roman.empty?
      ROMANS.each { |key, value|
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
