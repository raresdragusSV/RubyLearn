require 'axlsx'

class XlsFormatter
  def print(results)
    p = Axlsx::Package.new
    p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
      blue = sheet.styles.add_style :color => "#00FF00"
      sheet.add_row ["Id", "Input-type", "Input","Result","Created-At"], :style => blue
      results.each do |result|
        sheet.add_row [result.id, result.input_type, result.input, result.result, result.created_at], :types => [:integer, :string, :string, :string]
      end
    end
    p.use_shared_strings = true
    p.serialize('database.xlsx')
    puts 'The database.xlsx was created!!!'
  end
end
