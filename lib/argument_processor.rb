require_relative './number_converter/converter'
require_relative './number_converter/file_reader'
require_relative './number_converter/output'

class ArgumentProcessor
  attr_accessor :args, :converter, :file, :output_handler, :results

  def initialize(args)
    @args = args
    if @args[0] == '-r' || @args[0] == '-a'
      @converter = Converter.new(@args[0], @args[1])
    elsif @args[0] == '-f'
      @file = FileReader.new(@args[1])
    end
    if @converter
      @output_handler = Output.new()
    elsif @file
      @output_handler = Output.new(FileFormatter.new)
    end
  end

  def run
    if @converter
      @results = @converter.convert_by_format
    elsif @file
      @results = @file.read_file
    end
    @output_handler.print(@results)
  end
end


