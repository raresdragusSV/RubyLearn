require_relative './conversion'

class DescendingOrderer

  attr_accessor :order

  def initialize(order)
    columns = Conversion.column_names
    if columns.include?(order)
        @order = order + ' DESC'
    else
      puts "ERROR: The column name don't exist"
      exit
    end
  end
end

