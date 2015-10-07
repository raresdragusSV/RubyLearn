require_relative './defaultformatter'
require_relative './defaultorderer'

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
