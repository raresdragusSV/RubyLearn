require 'roman'

describe RomanNumber do
  context '.initialize' do
    it "should create new RomanNumeral('I')" do
      roman = RomanNumber.new('I')
      expect(roman.roman).to eq('I')
    end

    it "should create new RomanNumeral('N')" do
      roman = RomanNumber.new('N')
      expect(roman.roman).to eq(nil)
    end

    it "should create new RomanNumeral('xxxx')" do
      roman = RomanNumber.new('xxxx')
      expect(roman.roman).to eq(nil)
    end
  end

  context '.to_arabic' do
    it 'should convert I to 1' do
      roman = RomanNumber.new('I')
      expect(roman.to_arabic).to eq(1)
    end

    it 'should convert V to 5' do
      roman = RomanNumber.new('V')
      expect(roman.to_arabic).to eq(5)
    end

    it 'should convert X to 10' do
      roman = RomanNumber.new('X')
      expect(roman.to_arabic).to eq(10)
    end

    it 'should convert XXV to 25' do
      roman = RomanNumber.new('XXV')
      expect(roman.to_arabic).to eq(25)
    end

    it 'should convert MCMXXXIX to 1939' do
      roman = RomanNumber.new('MCMXXXIX')
      expect(roman.to_arabic).to eq(1939)
    end
  end
end
