require_relative './roman'
require_relative './crud'
require_relative './print'
require_relative './connection'

class Argument
  def self.create_arabic(argument)
    if argument.size == 1
      roman_num = RomanNumber.new(argument[0])
      unless roman_num.roman.nil?
        arabic = roman_num.to_arabic
        Crud.insert('roman', argument[0], arabic)
        Print.print_on_screen(arabic)
        return arabic
      end
    elsif argument.size == 0
      puts 'ERROR: You must supply an argument.'
    else
      puts 'ERROR: Too many arguments.'
    end
  end

  def self.create_roman(argument)
    if argument.size == 1
      arabic = ArabicNumber.new(argument[0])
      unless arabic.number.nil?
        roman = arabic.to_roman
        Crud.insert('arabic', argument[0], roman)
        Print.print_on_screen(roman)
        return roman
      end
    elsif argument.size == 0
      puts 'ERROR: You must supply an argument.'
    else
      puts 'ERROR: Too many arguments.'
    end
  end

  def self.create_file(argument)
    if argument.size == 1
      transform = []
      result = NewFile.read_file(argument[0])
      unless result.nil?

        result.each do |line|
          case line[0]
          when 'a'
            number = ArabicNumber.new(line[1])
            roman = number.to_roman
            transform << "#{ line[1] } #{ roman }"
            Crud.insert('arabic', line[1], roman)
          when 'r'
            roman = RomanNumber.new(line[1])
            arabic = roman.to_arabic
            transform << "#{ line[1] } #{ arabic }"
            Crud.insert('roman', line[1], arabic)
          end
        end
        puts "The results are in 'result.out' file"
        Print.print_to_file('result.out', transform)
      end
    elsif argument.size == 0
      puts 'ERROR: You must supply an argument.'
    else
      puts 'ERROR: Too many arguments.'
    end
  end

  def self.list_database(argument)
    if argument.size == 0
      converters = Converter.all
      Print.print_on_screen_from_database(converters)
    else
      puts "ERROR: This format can't have any arguments"
    end
  end

  def self.sort(argument)
    if argument.size == 0
      puts 'ERROR: You must supply an argument'
    elsif argument[0] != '-s'
      puts "ERROR: The next argumet must be '-s'"
    elsif argument[0] == '-s'
      columns = Converter.column_names
      if argument[1].nil?
        puts 'ERROR: You must supply a column table: id, input_type, input, result, converted_at'
      elsif columns.include? argument[1]
        value = argument[1]
        if argument[2].nil?
          converters = Converter.order(value)
          Print.print_on_screen_from_database(converters)
        elsif argument[2] == '-d'
          if argument[3].nil?
            puts 'ERROR: You must supply an argument for direction'
          elsif argument[3] == 'asc'
            converters = Converter.order(value)
            Print.print_on_screen_from_database(converters)
          elsif argument[3] == 'desc'
            converters = Converter.order(value + ' DESC')
            Print.print_on_screen_from_database(converters)
          else
            puts "ERROR: The direction can be 'asc' or 'desc'"
          end
        elsif argument[2] == '-f' && argument[3] == 'txt'
          converters = Converter.order(value)
          Print.print_on_txt_from_database('database.txt', converters)
          puts "The file 'database.txt' was created!"
        elsif argument[2] == '-f' && argument[3] == 'pdf'
          converters = Converter.order(value)
          Print.print_on_pdf_from_database('database.pdf', converters)
          puts "The file 'database.pdf' was created!"
        elsif argument[2] == '-f' && argument[3] == 'xls'
          converters = Converter.order(value)
          Print.print_on_xls_from_database('database.xlsx', converters)
          puts "The file 'database.xlsx' was created!"
        else
          puts "ERROR: The correct arguments are '-d asc','-d asc', '-f txt', '-f pdf', -f xls"
        end
      else
        puts "ERROR: The column name don't exist"
      end
    end
  end
end
