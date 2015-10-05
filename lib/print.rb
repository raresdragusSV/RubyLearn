class Print
  def self.print_on_screen(result)
    puts "The result is #{result}"
  end

  def self.print_to_file(filename, a)
    File.open(filename, "w+") do |f|
      a.each { |element| f.puts(element) }
    end
  end
end
