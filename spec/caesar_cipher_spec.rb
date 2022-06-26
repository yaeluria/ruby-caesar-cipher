require './caesar_cipher'

describe '#caesar_cipher' do
  it 'returns a string with all letters shifted by a factor' do
    expect(caesar_cipher('incredible', 2)).to eql('kpetgfkdng')
  end
  it 'returns a string with all letters shifted by a factor larger than the alphabet size' do
    expect(caesar_cipher('incredible', 29)).to eql('lqfuhgleoh')
  end
  it 'returns a string with the letters shifted and punctuation left in place' do
    expect(caesar_cipher('What a string, incredible!', 2)).to eql('Yjcv c uvtkpi, kpetgfkdng!')
  end
  it 'returns a string with the letters shifted and case preserved' do
    expect(caesar_cipher('IncrEdible', 2)).to eql('KpetGfkdng')
  end
end
