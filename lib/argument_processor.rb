require_relative './number_converter/converter'
require_relative './number_converter/file_reader'
require_relative './number_converter/output'
require_relative './number_converter/connection'
require_relative './number_converter/conversion'

class ArgumentProcessor
  attr_accessor :args, :converter, :file, :output_handler, :results

  def initialize(args)
    @args = args
    if @args[0] == '-r' || @args[0] == '-a'
      @converter = Converter.new(@args[0], @args[1])
    elsif @args[0] == '-f'
      @file = FileReader.new(@args[1])
    elsif @args[0] == '--list'
      @output_handler = Output.new(TableFormatter.new)
    end
    if @converter
      @output_handler = Output.new()
    elsif @file
      @output_handler = Output.new(FileFormatter.new)
    end
  end

  def self.write_to_db(input_type, input, result)
    conversion = Conversion.new(input_type: input_type, input: input, result: result)
    conversion.save
  end

  def self.get_from_db
    results = Conversion.all
    return results
  end

  def run
    if @converter
      @results = @converter.convert_by_format
      ArgumentProcessor.write_to_db(@results[0], @results[1], @results[2])
    elsif @file
      @results = @file.read_file
    elsif !@results
      @results = ArgumentProcessor.get_from_db
    end
    @output_handler.print(@results)
  end
end


