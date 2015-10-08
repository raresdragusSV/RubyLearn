module InputErrors
  def InputErrors::errors(args)
    if args.size == 0
      puts 'ERROR: This command must accept arguments!'
      exit
    elsif args.size == 1
      case args[0]
      when '-r'
        puts 'ERROR: You must supply a roman numeral!!!'
        exit
      when '-a'
        puts 'ERROR: You must supply an arabic number!!!'
        exit
      when '-f'
        puts 'ERROR: You must specify a text file!!!'
        exit
      when '--list'
      else
        puts 'ERROR: Wrong argument. Try -r, -a, -f, --list !!!'
        exit
      end
    elsif args.size == 2
      case args[0]
      when '--list'
        puts 'ERROR: --list could not have another argument!!!'
        exit
      when '-f'
        if !File.exist?(args[1])
          puts "ERROR: The file  you specify don't exist!!!"
          exit
        end
      end
    elsif args.size > 2
      case args[0]
      when '-r'
        puts 'ERROR: -r could not have more than two arguments!!!'
        exit
      when '-a'
        puts 'ERROR: -a could not have more than two arguments!!!'
        exit
      when '-f'
        puts 'ERROR: -f could not have more than two arguments!!!'
        exit
      end
    end
  end
end
