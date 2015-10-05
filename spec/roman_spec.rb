require 'roman'

describe Roman do
  it 'should convert I to 1' do
    expect(Roman.convert('I')).to eq(1)
  end

  it 'should convert V to 5' do
    expect(Roman.convert('V')).to eq(5)
  end

  it 'should convert X to 10' do
    expect(Roman.convert('X')).to eq(10)
  end

  it 'should convert XXV to 25' do
    expect(Roman.convert('XXV')).to eq(25)
  end

  it 'should convert 1939 to MCMXXXIX' do
    expect(Roman.convert('MCMXXXIX')).to eq(1939)
  end

end
