class TxtFormatter
  def print(results)
    File.open('database.txt', "w+") do |f|
      f.puts   '___________________________________________________________________________________________________'
      f.puts   '| Id | Input-type | Input | Result | Converted-At                                                 |'
      f.puts   '___________________________________________________________________________________________________'
      results.each do |result|
        f.puts "| #{result.id} | #{result.input_type} | #{result.input} | #{result.result} | #{result.created_at} |"
      end
    end
    puts 'The database.txt was created!!!'
  end
end
