require 'active_support'

require 'string_ext'

class SolitaireCipher
  def initialize(key_stream)
    raise ArgumentError.new("invalid argument 1, which should be a key stream") if key_stream.blank?
    @key_stream = pre_process key_stream
  end

  def encode(plain_text_string)
    process(plain_text_string) do |a, b|
      (a + b) % 26
    end
  end

  def decode(encoded_string)
    process(encoded_string) do |a, b|
      (a - b) % 26
    end
  end

  private
  def process(str, &block)
    post_process pre_process(str).zip(@key_stream).map(&block)
  end

  def pre_process(str)
    str.prepare_for_solitaire_encoding.pad.to_numeric_representation
  end

  def post_process(code)
    String.from_numeric_representation(code).to_block_form
  end
end