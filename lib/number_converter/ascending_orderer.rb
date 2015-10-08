require_relative './conversion'

class AscendingOrderer

  attr_accessor :order

  def initialize(order)
    columns = Conversion.column_names
    if columns.include?(order)
        @order = order
    else
      puts "ERROR: The column name don't exist"
      exit
    end
  end
end

