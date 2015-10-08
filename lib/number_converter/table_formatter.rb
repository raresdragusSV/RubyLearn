class TableFormatter
  def print(results)
    puts   '__________________________________________________'
    puts   '| Id | Input-type | Input | Result | Converted-At |'
    puts   '__________________________________________________'
    results.each do |result|
      puts "| #{result.id} | #{result.input_type} | #{result.input} | #{result.result} | #{result.created_at} |"
    end
  end
end
