require 'converter'

describe Convert do
  context '.initialize' do
    it 'should create new Converter(-r)' do
      converter = Convert.new('-r')
      expect(converter.format).to eq('-r')
    end

    it 'should not create Converter(-b)' do
      converter = Convert.new('-b')
      expect(converter.format).to eq(nil)
    end
  end

  context '.convert_by_format' do
    it "should convert roman 5 to 'V" do
      convert = Convert.new('-a')
      expect(convert.convert_by_format([5])).to eq('V')
    end

    it "should convert roman 'V' to 5" do
      convert = Convert.new('-r')
      expect(convert.convert_by_format(['V'])).to eq(5)
    end
  end
end
