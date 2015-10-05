require 'arabic'

describe Arabic do
  it 'should convert 1 to I' do
    expect(Arabic.convert(1)).to eq('I')
  end

  it 'should convert 5 to V' do
    expect(Arabic.convert(5)).to eq('V')
  end

  it 'should convert 10 to X' do
    expect(Arabic.convert(10)).to eq('X')
  end

  it 'should convert 25 to XXV' do
    expect(Arabic.convert(25)).to eq('XXV')
  end

  it 'should convert 1939 to MCMXXXIX' do
    expect(Arabic.convert(1939)).to eq('MCMXXXIX')
  end

  it 'should convert 0 to N' do
    #added this to see what happens, as expected, it doesn't work
    expect(Arabic.convert(0)).to eq('N')
  end

  # you should also add more egde-cases and complicated numbers to both tests
  # also consider adding a few wrong numbers as well, it should handle it gracefully,
  # not the way Roman currently handles errors

end
