require './caesar_cipher'

describe '#caesar_cipher' do
  let(:string) { 'incredible' }
  let(:expected_result) { 'kpetgfkdng' }
  let(:shift_num) { 2 }
  let(:method_result) { caesar_cipher(string, shift_num) }

  it { expect(method_result).to eq expected_result }

  context 'when shift_num is bigger than the letters count' do
    let(:letters_count) { 26 }
    let(:shift_num) { 2 + letters_count * 3 }

    it { expect(method_result).to eq expected_result }
  end
  context 'when shift_num is negative' do
    let(:shift_num) { -2 }
    let(:expected_result) { 'glapcbgzjc' }

    it { expect(method_result).to eq expected_result }
  end
  context 'when string contains non alphabetic characters' do
    let(:string) { 'what a string, incredible!' }
    let(:expected_result) { 'yjcv c uvtkpi, kpetgfkdng!' }

    it { expect(method_result).to eq expected_result }
  end
  context 'when string contains uppercase letters' do
    let(:string) { 'IncrEdible' }
    let(:expected_result) { 'KpetGfkdng' }

    it { expect(method_result).to eq expected_result }
  end
  context 'when string is empty' do
    let(:string) { '' }
    let(:expected_result) { '' }

    it { expect(method_result).to eq expected_result }
  end
end
