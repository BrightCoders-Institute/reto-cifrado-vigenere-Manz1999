# This class implements the Vigenere cipher algorithm for encrypting messages.

class VigenereCipher
  def initialize(key)
    @key = key.upcase
  end

  def encrypt(message)
    uppercase_message = message.upcase
    encryptedtext = ''

    uppercase_message.each_char.with_index do |char, index|
      encrypted_char = encrypt_character(char, index)
      encryptedtext << encrypted_char
    end

    encryptedtext
  end

  private

  def encrypt_character(char, index)
    return char unless char.match(/[A-Z]/)

    shift = @key[index % @key.length].ord - 'A'.ord
    ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
  end
end

# Solicitar mensaje y clave al usuario
print 'Enter text to encrypt: '
message = gets.chomp

print 'Enter key: '
key = gets.chomp

cipher = VigenereCipher.new(key)
encryptedtext = cipher.encrypt(message)

puts "Encrypted text: #{encryptedtext}"
