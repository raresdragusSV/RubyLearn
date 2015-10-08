class DefaultFormatter
  def print(results)
    if results[0] == 'error'
      puts "#{results[2]}"
    else
      puts "The result is #{results[2]}"
    end
  end
end
