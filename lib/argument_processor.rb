require_relative './number_converter/converter'
require_relative './number_converter/output'

class ArgumentProcessor
  attr_accessor :args, :converter, :output_handler, :results

  def initialize(args)
    @args = args
    if @args[0] == '-r' || '-a'
      @converter = Converter.new(@args[0], @args[1])
      @output_handler = Output.new()
    end
  end

  def run
    @results = @converter.convert_by_format if @converter
    p @results
    @output_handler.print(@results)
  end
end


