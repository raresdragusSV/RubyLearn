require 'arabic'

describe ArabicNumber do
  context '.initialize' do
    it 'should create Arabic(1)' do
       arabic = ArabicNumber.new(1)
       expect(arabic.number).to eq(1)
    end
    it 'should not create Arabic(0)' do
       arabic = ArabicNumber.new(0)
       expect(arabic.number).to eq(nil)
    end
    it 'should not create Arabic(4500)' do
       arabic = ArabicNumber.new(4500)
       expect(arabic.number).to eq(nil)
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
  end
end
