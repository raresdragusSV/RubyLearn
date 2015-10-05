require 'roman'

describe Roman do
  it 'should convert I to 1' do
    roman = Roman.new('I')
    expect(roman.convert('I')).to eq(1)
  end

  it 'should convert V to 5' do
    roman = Roman.new('V')
    expect(roman.convert('V')).to eq(5)
  end

  it 'should convert X to 10' do
    roman = Roman.new('X')
    expect(roman.convert('X')).to eq(10)
  end

  it 'should convert XXV to 25' do
    roman = Roman.new('XXV')
    expect(roman.convert('XXV')).to eq(25)
  end

  it 'should convert 1939 to MCMXXXIX' do
    roman = Roman.new('MCMXXXIX')
    expect(roman.convert('MCMXXXIX')).to eq(1939)
  end

end
