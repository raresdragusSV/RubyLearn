require 'argument'

describe Argument do
  context '.create_arabic' do
    it 'should return nil for many arguments' do
      expect(Argument.create_arabic(['VIII', '-b', 1232])).to eq(nil)
    end

    it 'should return nil for none argument' do
      expect(Argument.create_arabic([])).to eq(nil)
    end

    it "shoul return 5 for the single argument['V']" do
      expect(Argument.create_arabic(['V'])).to eq(5)
    end
  end

  context '.create_roman' do
    it 'should return nil for many arguments' do
      expect(Argument.create_roman([8, '-b', 1232])).to eq(nil)
    end

    it 'should return nil for none argument' do
      expect(Argument.create_roman([])).to eq(nil)
    end

    it "shoul return V for the single argument[5]" do
      expect(Argument.create_roman([5])).to eq('V')
    end
  end

  context '.create_file' do
    it 'should return nil for many arguments' do
      expect(Argument.create_file(['input.in', '-b', 1232])).to eq(nil)
    end

    it 'should return nil for none argument' do
      expect(Argument.create_file([])).to eq(nil)
    end

  end
end
