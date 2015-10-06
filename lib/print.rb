class Print
  def self.print_on_screen(result)
    puts "The result is #{result}"
  end

  def self.print_to_file(filename, a)
    File.open(filename, "w+") do |f|
      a.each { |element| f.puts(element) }
    end
  end

  def self.print_on_screen_from_database(results)
    puts   '________________________________________________________________________________________________________________________________________________'
    puts   '| Id | Input-type | Input | Result | Converted-At                                                                                              |'
    puts   '_______________________________________________________________________________________________________________________________________________'
    results.each do |result|
      puts "| #{result.id} | #{result.input_type} | #{result.input} | #{result.result} | #{result.converted_at} |"
    end
  end
end
