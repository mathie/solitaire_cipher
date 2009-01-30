require 'active_support'

class SolitaireCipher
  def initialize(key_stream)
    raise ArgumentError.new("invalid argument 1, which should be a key stream") if key_stream.blank?
    @key_stream = key_stream
  end
end