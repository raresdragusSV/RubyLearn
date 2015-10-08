require 'prawn/table'
require 'prawn'

class PdfFormatter
  def print(results)
    Prawn::Document.generate('database.pdf') do |pdf|
      table_data =[['Id', 'Input Type', 'Input', 'Result', 'Created At']]
      results.each do |result|
        table_data +=  [["#{result.id}" , "#{result.input_type}",  "#{result.input}" , "#{result.result}" , "#{result.created_at}" ]]
      end
      pdf.table(table_data)
    end
    puts 'The database.pdf was created !!!'
  end
end
