module StringExtensions
  module InstanceMethods
    # Prepare the string for solitaire encoding by removing every non-alpha
    # character and upcasing the result.
    def prepare_for_solitaire_encoding
      upcase.gsub(/[^A-Z]/, '')
    end

    # Take a string which has been encoded into a format suitable for encoding
    # with Solitaire and split it into blocks of 5 characters.
    def to_block_form(block_size = 5)
      scan(Regexp.new("." * block_size)).join(" ")
    end

    # Pad a string with extra "X" characters (by default) to make it up to a
    # multiple of 5 characters wide, in total.
    def pad(block_size = 5, pad_character = "X")
      pad_chars = block_size - length % block_size
      if pad_chars == block_size
        self
      else
        self + (pad_character * pad_chars)
      end
    end

    # Turn a string into an appropriate array of integers which represent the
    # associated characters (A == 1, B == 2, etc).
    def to_numeric_representation
      split("").map { |c| c.ord - ?A + 1 }
    end
  end

  module ClassMethods
    # Turn an array of integers into the characters they represent.  The
    # inverse of #to_numeric_representation.
    def from_numeric_representation(array_of_ints)
      array_of_ints.map { |i| (i + ?A - 1).chr }.join
    end
  end
end

String.class_eval do
  include StringExtensions::InstanceMethods
  extend  StringExtensions::ClassMethods
end
