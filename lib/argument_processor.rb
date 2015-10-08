require_relative './number_converter/converter'
require_relative './number_converter/file_reader'
require_relative './number_converter/output'
require_relative './number_converter/connection'
require_relative './number_converter/conversion'
require_relative './number_converter/txt_formatter'
require_relative './number_converter/xls_formatter'
require_relative './number_converter/pdf_formatter'

class ArgumentProcessor
  attr_accessor :args, :converter, :file, :output_handler, :results, :order_result

  def initialize(args)
    @args = args
    if @args[0] == '-r' || @args[0] == '-a'
      @converter = Converter.new(@args[0], @args[1])
    elsif @args[0] == '-f'
      @file = FileReader.new(@args[1])
    elsif @args[0] == '-l' && @args.size == 1
      @output_handler = Output.new(TableFormatter.new)
    elsif @args[0] == '-l' && @args.size == 3
      @output_handler = Output.new(TableFormatter.new, AscendingOrderer.new(@args[2]))
    elsif @args[0] == '-l' && @args.size > 3
      if @args.include?('-d')
        index = @args.index('-d')
        next_arg = @args[index + 1]
        if next_arg == 'asc'
          orderer = AscendingOrderer.new(@args[2])
        else
          next_arg == 'desc'
          orderer = DescendingOrderer.new(@args[2])
        end
      else
        orderer = AscendingOrderer.new(@args[2])
      end
      if @args.include?('-f')
        index = @args.index('-f')
        next_arg = @args[index + 1]
        if next_arg == 'txt'
          formatter = TxtFormatter.new()
        elsif next_arg == 'pdf'
          formatter = PdfFormatter.new()
        elsif next_arg == 'xls'
          formatter = XlsFormatter.new()
        end
      else
        formatter = TableFormatter.new()
      end
      @output_handler = Output.new(formatter, orderer)
    end
    if @converter
      @output_handler = Output.new()
    elsif @file
      @output_handler = Output.new(FileFormatter.new)
    end
    @order_result = @output_handler.orderer.order
  end

  def self.write_to_db(input_type, input, result)
    conversion = Conversion.new(input_type: input_type, input: input, result: result)
    conversion.save
  end

  def self.get_from_db(sort_value)
    results = Conversion.order(sort_value)
    return results
  end

  def run
    if @converter
      @results = @converter.convert_by_format
      ArgumentProcessor.write_to_db(@results[0], @results[1], @results[2])
    elsif @file
      @results = @file.read_file
    elsif !@results
      @results = ArgumentProcessor.get_from_db(@order_result)
    end
    @output_handler.print(@results)
  end
end


