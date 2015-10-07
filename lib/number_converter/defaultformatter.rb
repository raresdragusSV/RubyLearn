class DefaultFormatter
  def print(results)
    if results[1].to_s.start_with? 'ERROR'
      puts "#{results[1]}"
    else
      puts "The result is #{results[1]}"
    end
  end
end
