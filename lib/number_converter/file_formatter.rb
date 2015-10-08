require_relative './converter'

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
          f.puts("#{line[0]} #{line[1]}")
        end
      end
    end
    puts 'The results are in result.out file!!!'
  end
end


