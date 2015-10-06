require 'prawn'

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

  def self.print_on_txt_from_database(filename, results)
    File.open(filename, "w+") do |f|
      f.puts   '___________________________________________________________________________________________________'
      f.puts   '| Id | Input-type | Input | Result | Converted-At                                                 |'
      f.puts   '___________________________________________________________________________________________________'
      results.each do |result|
        f.puts "| #{result.id} | #{result.input_type} | #{result.input} | #{result.result} | #{result.converted_at} |"
      end
    end
  end

  def self.print_on_pdf_from_database(filename, results)
    Prawn::Document.generate(filename) do
      text '__________________________________________________'
      text '| Id | Input-type | Input | Result | Converted-At|'
      text '__________________________________________________'
      results.each do |result|
        text "| #{result.id} | #{result.input_type} | #{result.input} | #{result.result} | #{result.converted_at} |"
      end
    end
  end
end
