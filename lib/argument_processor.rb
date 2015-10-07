## EXAMPLE CLASS STRUCTURE
#  class ArgumentPorcessor
#  initialize(args)
#    sets @converter = Converter.new(format, arg) if required by arguments
#    sets @output_handler = SomeOutput.new() in any case
#       the output generator class could use "dependecy injection"
#       meaning it can be initialized with the formatter and orderer
#       to do this you should gave different classes like PdfFormatter, XlsFormatter,
#       TxtFormatter, DefaultFormatter(which outpouts to console)
#       then the initialize of the output handler would look like this
#       initialize(formatter = DefaultFormatter.new(), orderer = DefaultOrderer.new())
#  #write_to_db
#    pushes @results in DB
#  #get_from_db
#    get the records from db
#  #run
#     @results = @converter.convert_by_format if @converter
#     write_to_db if @results
#     get_from_db if !@results
#     @ouptut_handler.print(@results)
