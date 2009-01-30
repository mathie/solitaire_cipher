
module StringExtensions
  module PrepareForSolitaireEncoding
    # Prepare the string for solitaire encoding by removing every non-alpha
    # character and upcasing the result.
    def prepare_for_solitaire_encoding
      upcase.gsub(/[^A-Z]/, '')
    end
  end

  module BlockAndPad
    # Take a string which has been encoded into a format suitable for encoding
    # with Solitaire and split it into blocks of 5 characters, using Xs to pad
    # the last block if necessary.
    def to_block_form(block_size = 5)
      scan(Regexp.new("." * block_size)).join(" ")
    end

    def pad(block_size = 5, pad_character = "X")
      pad_chars = block_size - length % block_size
      if pad_chars == block_size
        self
      else
        self + (pad_character * pad_chars)
      end
    end
  end

  module Conversions
    module ClassMethods
      def from_numeric_representation(array_of_ints)
        array_of_ints.map { |i| (i + ?A - 1).chr }.join
      end
    end

    module InstanceMethods
      def to_numeric_representation
        split("").map { |c| c.ord - ?A + 1 }
      end
    end
  end
end

String.class_eval do
  include StringExtensions::BlockAndPad
  include StringExtensions::PrepareForSolitaireEncoding
  include StringExtensions::Conversions::InstanceMethods
  extend  StringExtensions::Conversions::ClassMethods
end
