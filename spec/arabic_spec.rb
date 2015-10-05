require 'arabic'

describe Arabic do
  it 'should convert 1 to I' do
    arabic = Arabic.new(1)
    expect(arabic.convert(1)).to eq('I')
  end

  it 'should convert 5 to V' do
    arabic = Arabic.new(5)
    expect(arabic.convert(5)).to eq('V')
  end

  it 'should convert 10 to X' do
    arabic = Arabic.new(10)
    expect(arabic.convert(10)).to eq('X')
  end

  it 'should convert 25 to XXV' do
    arabic = Arabic.new(25)
    expect(arabic.convert(25)).to eq('XXV')
  end

  it 'should convert 1939 to MCMXXXIX' do
    arabic = Arabic.new(1939)
    expect(arabic.convert(1939)).to eq('MCMXXXIX')
  end

end
