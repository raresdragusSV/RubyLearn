require 'prawn'
require 'axlsx'

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
    # pdf should be a nice looking table, not an ASCII table
    Prawn::Document.generate(filename) do
      text '__________________________________________________'
      text '| Id | Input-type | Input | Result | Converted-At|'
      text '__________________________________________________'
      results.each do |result|
        text "| #{result.id} | #{result.input_type} | #{result.input} | #{result.result} | #{result.converted_at} |"
      end
    end
  end

  def self.print_on_xls_from_database(filename, results)
    p = Axlsx::Package.new
    p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
      sheet.add_row ["Id", "Input-type", "Input","Result","Converted-At"]
      # make sure you set the type of each field so excel recognises it,
      # and formats it as desired
      results.each do |result|
        sheet.add_row [result.id, result.input_type, result.input, result.result, result.converted_at]
      end
    end
    p.use_shared_strings = true
    p.serialize(filename)
  end
end
