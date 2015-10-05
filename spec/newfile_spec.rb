require 'newfile'

describe NewFile do
  it 'should open test.in an create array from lines' do
    result = NewFile.read_file('test.in')
    expect(result).to eq([['r','VII'],['a','213'],['a','31'],['r','IX']])
  end
end
