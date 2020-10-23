# c_cipher.rb
# caesar_cipher takes a string and a factor and ouputs a ciphered message using the caesar method.

def caesar_cipher(message, factor)
  message_a = message.split('')
  ciphered_message = message_a.map do |letter|
    cipher_letter(letter, factor)
  end
  ciphered_message.join('')
end

def cipher_letter(letter, factor)
  alphabet = ('a'..'z').to_a

  # exception with symbols and blank spaces
  return letter unless alphabet.include?(letter.downcase)

  # find current letter index
  ciphered_index = alphabet.find_index(letter.downcase) + factor
  ciphered_index -= 26 while ciphered_index > 25

  # modify letter acording lower/upper case
  if letter == letter.downcase
    alphabet[ciphered_index].downcase
  else
    alphabet[ciphered_index].upcase
  end
end

# example
puts caesar_cipher('What a string!', 5) # output=> "Bmfy f xywnsl!"
