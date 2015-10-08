require_relative './converter'
require_relative '../argument_processor'

class FileFormatter
  def print(results)
    File.open('result.out', "w+") do |f|
      results.each do |result|
        case result[0]
        when 'error'
          puts "#{result[1]}"
          break
        else
          converter = Converter.new(result[0], result[1])
          line = converter.convert_by_format
          f.puts("#{line[1]} #{line[2]}")
          ArgumentProcessor.write_to_db(line[0],line[1],line[2])
        end
      end
    end
    puts 'The results are in result.out file!!!'
  end
end


