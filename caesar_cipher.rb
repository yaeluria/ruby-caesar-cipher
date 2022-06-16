LETTERS_ARRAY = ('a'..'z').to_a

# @param [Array] array - array on which we search the new index
# @param [Integer] index - starting index
# @param [Integer] shift_num - integer saying how much to shift the index (right)
#
# @return [Integer] shifted index
#
def circular_shift_index(array, index, shift_num)
  (index + shift_num) % array.length
end

def caesar_cipher_char(char, shift_num)
  letter_index = LETTERS_ARRAY.index(char.downcase)
  return char unless letter_index

  shifted_index = circular_shift_index(LETTERS_ARRAY, letter_index, shift_num)
  ciphered_lowercase_char = LETTERS_ARRAY[shifted_index]
  char == char.upcase ? ciphered_lowercase_char.upcase : ciphered_lowercase_char
end

def caesar_cipher(string, shift_num)
  string.chars.map { |char| caesar_cipher_char(char, shift_num) }.join
end
