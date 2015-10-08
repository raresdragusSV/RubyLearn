require_relative './arabic_number'
require_relative './roman_numeral'

class FileReader
  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def read_file
    line_num = 0
    lines = []
    text = File.open(@filename).read
    text.each_line do |line|
      line_num += 1
      line_without_return = line.upcase.chomp

      if ArabicNumber.parse_number_string(line_without_return)
        if ArabicNumber.valid?(line_without_return)
          lines << ['-a', line_without_return]
        else
          lines << ['error',"ERROR on line #{line_num}"]
          break
        end
      else
        if RomanNumeral.valid?(line_without_return)
          lines << ['-r', line_without_return]
        else
          lines << ['error',"ERROR on line #{line_num}"]
          break
        end
      end
    end
    return lines
  end
end
