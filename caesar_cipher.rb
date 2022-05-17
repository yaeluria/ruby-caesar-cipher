
LETTERS_ARRAY = ("a".."z").to_a

def caesar_cipher(string, shift_num)
    chars_array = string.chars
    ciphered_array = chars_array.map  do |char|
        if LETTERS_ARRAY.index(char.downcase)
            ciphered_index = LETTERS_ARRAY.index(char.downcase) + shift_num
            ciphered_lowercase_char = LETTERS_ARRAY[ciphered_index] || LETTERS_ARRAY[ciphered_index - LETTERS_ARRAY.length]
            char == char.upcase ? ciphered_lowercase_char.upcase : ciphered_lowercase_char
        else char
        end
    end
    ciphered_array.join
end
