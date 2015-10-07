require 'number_converter/converter'

describe Converter do
  context '.initialize' do
    it "should create a Converter('-r', 1233)" do
      converter = Converter.new('-r', 1233)
      expect(converter.format).to eq('-r')
      expect(converter.input).to eq(1233)
    end

    it "should create a Converter('-v', 1233)" do
      converter = Converter.new('-v', 1233)
      expect(converter.format).to eq(nil)
      expect(converter.input).to eq(nil)
    end
  end

  context '.valid?' do
    it 'should return false for format -v' do
      expect(Converter.valid?('-v')).to eq(false)
    end

    it 'should return true for format -a' do
      expect(Converter.valid?('-a')).to eq(true)
    end
  end

  context '.convert_by_format' do
    it 'should return [I,1]' do
      converter = Converter.new('-r', 'I')
      expect(converter.convert_by_format).to eq(['I', 1])
    end

    it "should return [IIIVM,'ERROR: The input is not a valid roman numeral']" do
      converter = Converter.new('-r', 'IIIVM')
      expect(converter.convert_by_format).to eq(['IIIVM', 'ERROR: The input is not a valid roman numeral'])
    end

    it "should return [1, 'I']" do
      converter = Converter.new('-a', 1)
      expect(converter.convert_by_format).to eq([1, 'I'])
    end

    it "should return [4500, 'ERROR: The input is not a valid number, zero or bigger than 4000']" do
      converter = Converter.new('-a', 4500)
      expect(converter.convert_by_format).to eq([4500, 'ERROR: The input is not a valid number, zero or bigger than 4000'])
    end

    it "should return [4ab0, 'ERROR: The input is not a valid number, zero or bigger than 4000']" do
      converter = Converter.new('-a', '4ab0')
      expect(converter.convert_by_format).to eq(['4ab0', 'ERROR: The input is not a valid number, zero or bigger than 4000'])
    end
  end
end
