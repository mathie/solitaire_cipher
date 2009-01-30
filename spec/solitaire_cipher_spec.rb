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

describe SolitaireCipher do
  before(:each) do
    @key_stream = "DWJXH YRFDG TMSHP UURXJ"
    @solitaire_cipher = SolitaireCipher.new(@key_stream)
  end

  describe "encoding a string" do
    it "should encode the string 'Code in Ruby, live longer!' as 'GLNCQ MJAFF FVOMB JIYCB'" do
      @solitaire_cipher.encode("Code in Ruby, live longer!").should == "GLNCQ MJAFF FVOMB JIYCB"
    end
  end

  describe "decoding a string" do
    it "should decode the string 'GLNCQ MJAFF FVOMB JIYCB' as 'CODEI NRUBY LIVEL ONGER'" do
      @solitaire_cipher.decode("GLNCQ MJAFF FVOMB JIYCB").should == "CODEI NRUBY LIVEL ONGER"
    end
  end
end
