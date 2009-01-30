require 'active_support'

require 'string_ext'

class SolitaireCipher
  def initialize(key_stream)
    raise ArgumentError.new("invalid argument 1, which should be a key stream") if key_stream.blank?
    @key_stream = key_stream.prepare_for_solitaire_encoding
  end

  def encode(plain_text_string)
    String.from_numeric_representation(plain_text_string.prepare_for_solitaire_encoding.pad.to_numeric_representation.zip(@key_stream.to_numeric_representation).map { |a, b| (a + b) % 26 }).to_block_form
  end

  def decode(encoded_string)
    String.from_numeric_representation(encoded_string.prepare_for_solitaire_encoding.pad.to_numeric_representation.zip(@key_stream.to_numeric_representation).map { |a, b| (a - b) % 26 }).to_block_form
  end
end