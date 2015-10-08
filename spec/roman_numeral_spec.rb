require 'number_converter/roman_numeral'

describe RomanNumeral do
  context '.initialize' do
    it "should create new RomanNumeral('i')" do
      roman_numeral = RomanNumeral.new('i')
      expect(roman_numeral.roman).to eq('I')
      expect(roman_numeral.valid).to eq(true)
    end

    it "should create new RomanNumeral('n')" do
      roman_numeral = RomanNumeral.new('n')
      expect(roman_numeral.roman).to eq('N')
      expect(roman_numeral.valid).to eq(false)
    end

    it "should create new RomanNumeral('xxxc')" do
      roman_numeral = RomanNumeral.new('xxxc')
      expect(roman_numeral.roman).to eq('XXXC')
      expect(roman_numeral.valid).to eq(false)
    end
  end

  context '.valid?' do
    it 'should return true for roman vii' do
      expect(RomanNumeral.valid?('vii')).to eq(true)
    end

    it 'should return false for roman vxxxM' do
      expect(RomanNumeral.valid?('vxxxM')).to eq(false)
    end
  end

  context '.to_arabic' do
    it 'should convert I to 1' do
      roman_numeral = RomanNumeral.new('I')
      expect(roman_numeral.to_arabic).to eq(1)
    end

    it 'should convert V to 5' do
      roman_numeral = RomanNumeral.new('V')
      expect(roman_numeral.to_arabic).to eq(5)
    end

    it 'should convert X to 10' do
      roman_numeral = RomanNumeral.new('X')
      expect(roman_numeral.to_arabic).to eq(10)
    end

    it 'should convert XXV to 25' do
      roman_numeral = RomanNumeral.new('XXV')
      expect(roman_numeral.to_arabic).to eq(25)
    end

    it 'should convert MCMXXXIX to 1939' do
      roman_numeral = RomanNumeral.new('MCMXXXIX')
      expect(roman_numeral.to_arabic).to eq(1939)
    end

    it 'should return error for VXXXM' do
      roman_numeral = RomanNumeral.new('VXXXM')
      expect(roman_numeral.to_arabic).to eq('error')
    end
  end
end
