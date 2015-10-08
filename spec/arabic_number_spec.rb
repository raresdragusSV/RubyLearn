require 'number_converter/arabic_number'

describe ArabicNumber do
  context '.initialize' do
    it 'should create ArabicNumber(1)' do
       arabic_number = ArabicNumber.new(1)
       expect(arabic_number.arabic).to eq(1)
       expect(arabic_number.valid).to eq(true)
    end
    it 'should not create ArabicNumber(0)' do
       arabic_number = ArabicNumber.new(0)
       expect(arabic_number.arabic).to eq(0)
       expect(arabic_number.valid).to eq(false)
    end
    it 'should not create ArabicNumber(4500)' do
       arabic_number = ArabicNumber.new('4500')
       expect(arabic_number.arabic).to eq('4500')
       expect(arabic_number.valid).to eq(false)
    end
  end

  context 'parse_number_string' do
    it 'should convert "1" to 1' do
      r = ArabicNumber.parse_number_string('1')
      expect(r).to eq(1)
    end

    it 'should not convert "xxx" to a number' do
      r = ArabicNumber.parse_number_string('xxx')
      expect(r).to eq(nil)
    end
  end

  context '.valid?' do
    it 'should return false if arabic is 4500' do
      expect(ArabicNumber.valid?(4500)).to eq(false)
    end

    it 'should return true if arabic is 23' do
      expect(ArabicNumber.valid?(23)).to eq(true)
    end

    it "should return true if arabic is '23'" do
      expect(ArabicNumber.valid?(23)).to eq(true)
    end
  end
  context '.to_roman' do
    it 'should convert 1 to I' do
      arabic = ArabicNumber.new(1)
      expect(arabic.to_roman).to eq('I')
    end

    it 'should convert 5 to V' do
      arabic = ArabicNumber.new(5)
      expect(arabic.to_roman).to eq('V')
    end

    it 'should convert 10 to X' do
      arabic = ArabicNumber.new(10)
      expect(arabic.to_roman).to eq('X')
    end

    it 'should convert 25 to XXV' do
      arabic = ArabicNumber.new(25)
      expect(arabic.to_roman).to eq('XXV')
    end

    it 'should convert 1939 to MCMXXXIX' do
      arabic = ArabicNumber.new(1939)
      expect(arabic.to_roman).to eq('MCMXXXIX')
    end

    it "should convert '1939' to MCMXXXIX" do
      arabic = ArabicNumber.new('1939')
      expect(arabic.to_roman).to eq('MCMXXXIX')
    end
  end
end
