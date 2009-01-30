require File.join(File.dirname(__FILE__), 'spec_helper')

describe SolitaireCipher, "creation" do
  it "should allow us to create a new instance with a key stream as a string" do
    lambda {
      SolitaireCipher.new("KEYS TREA MONE")
    }.should_not raise_error
  end

  it "should require a key steam to be specified" do
    lambda {
      SolitaireCipher.new()
    }.should raise_error(ArgumentError)

    lambda {
      SolitaireCipher.new(nil)
    }.should raise_error(ArgumentError)
  end
end