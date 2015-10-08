require_relative './default_formatter'
require_relative './default_orderer'

class Output
  attr_accessor :formatter, :orderer

  def initialize(formatter = DefaultFormatter.new, orderer = DefaultOrderer.new)
    @formatter = formatter
    @orderer = orderer
  end

  def print(results)
    @formatter.print(results)
  end
end