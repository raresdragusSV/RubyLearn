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
    # this is a test to convert MCMXXXIX, not what it says in
    # the description
    expect(Roman.convert('MCMXXXIX')).to eq(1939)
  end

  # it 'should convert N to 0' do
  #   # added this to see what happens, as expected, it doesn't work
  #   # and it also breaks the tests
  #   expect(Roman.convert('N')).to eq(0)
  # end

  it 'should convert MM to 2000' do
    expect(Roman.convert('MM')).to eq(2000)
  end

end
