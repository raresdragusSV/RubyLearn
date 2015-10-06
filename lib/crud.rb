require_relative './connection'

class Crud
  def self.insert(input_type, input, result)
    converter = Converter.new(input_type: input_type, input: input, result: result, converted_at: Time.current)
    converter.save
  end
end
