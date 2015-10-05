require_relative './roman'
require_relative './arabic'

class Converter

  @@formats = ['-r', '-a' , '-f']

  attr_accessor :format, :argument

  def initialize(format, argument)
    @format = format
    @argument = argument
  end

  def validation
    # better name according to ruby style guide
    # would be valid? or input_valid?
    raise 'The format is not valid' unless @@formats.include? @format || @format.nil?
    raise 'The argument is not present' if @argument.nil?
    case @format
    # only argument-validation should be handled in this class
    # maybe even in a new ArgumentValidator class (so it can easaly incorporate later cases)
    # the validation of formats and ranges should be handled by the Roman/Arabic classes
    when @@formats[0]
      Converter.roman?(@argument)
    when @@formats[1]
      Converter.arabic?(@argument)
    when @@formats[2]
      Converter.file?(@argument)
    end
  end

  def self.roman?(argument)
    if argument.size > 14 || argument.upcase.scan(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/).empty?
      # why is size handled separately, it should be handled by the regex
      # also, try using =~ for regex "equality" comparison
      raise 'The argument is not a valid roman number.'
      # you should create your own error class instead of using RuntimeError
    else
      true
    end
  end

  def self.arabic?(argument)
    if Converter.convert_number(argument) && Converter.convert_number(argument).between?(0, 4000)
      true
    else
      raise 'The argument is not a valid number or greater than 4000.'
    end
  end

  def self.file?(argument)
    raise 'The file you specify is not exist!!!' unless File.exist?(argument)
  end

  def self.convert_number(object)
    # a better name would be parse_number_string or somethin similar
    # this is not a convesrion yet, so it's confusing
    begin
      return Integer(object)
    rescue
      return nil
    end
  end

  def init
    # init, as a function name has no meaning
    # change it to something more meaningful
    case @format
    when @@formats[0]
      result = Roman.convert(@argument.upcase)
    when @@formats[1]
      result = Arabic.convert(Converter.convert_number(@argument))
    end
  end

  def printing_to_screen(result)
    # use print_to_screen as method name
    # also, consider moving printing to output into it's own class
    # this isn't necessary for now but it would make next steps easier
    # And in general it's a good idea to have input/output processing separate
    # from general logic
    puts "The result is #{result}"
  end
end
