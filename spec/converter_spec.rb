require 'converter'

describe Converter do
  context '.initialize' do
    it 'should create new Converter(-r)' do
      converter = Converter.new('-r')
      expect(converter.format).to eq('-r')
    end

    it 'should not create Converter(-b)' do
      converter = Converter.new('-b')
      expect(converter.format).to eq(nil)
    end
  end

  context '.convert_by_format' do
    it "should convert roman 5 to 'V" do
      convert = Converter.new('-a')
      expect(convert.convert_by_format(5)).to eq('V')
    end

    it "should convert roman 'V' to 5" do
      convert = Converter.new('-r')
      expect(convert.convert_by_format('V')).to eq(5)
    end
  end
end
