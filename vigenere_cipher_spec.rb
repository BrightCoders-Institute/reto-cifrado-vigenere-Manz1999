require 'rspec'
require_relative './vigenere_cipher'

RSpec.describe VigenereCipher do
  describe '#encrypt' do
    it 'encrypts a message using the Vigenere cipher' do
      allow_any_instance_of(Object).to receive(:gets).and_return('HELLO', 'KEY')
      cipher = VigenereCipher.new('KEY')
      encrypted = cipher.encrypt('HELLO')
      expect(encrypted).to eq('RIJVS')
    end

    it 'encrypts a message with non-alphabetic characters' do
      cipher = VigenereCipher.new('KEY')
      encrypted = cipher.encrypt('HELLO!')
      expect(encrypted).to eq('RIJVS!')
    end

    it 'returns an empty string when given an empty message' do
      cipher = VigenereCipher.new('KEY')
      encrypted = cipher.encrypt('')
      expect(encrypted).to eq('')
    end
  end
end
