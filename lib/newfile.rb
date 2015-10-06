require_relative './arabic'
require_relative './roman'
require_relative './connection'

class NewFile

  def self.read_file(filename)
    if File.exist?(filename)
      line_num = 0
      lines = []
      text = File.open(filename).read
      text.each_line do |line|
        line_num += 1
        line_without_return = line.upcase.chomp

        if ArabicNumber.parse_number_string(line_without_return)
          if ArabicNumber.valid?(line_without_return)
            lines << ['a', line_without_return]
          else
            puts "ERROR on line #{line_num}"
            break
          end
        else
          if RomanNumber.valid?(line_without_return)
            lines << ['r', line_without_return]
          else
            puts "ERROR on line #{line_num}"
            break
          end
        end
      end
      return lines
    else
      puts 'ERROR: The file you specify is not exist!!!'
      lines = nil
      return lines
    end
  end
end
