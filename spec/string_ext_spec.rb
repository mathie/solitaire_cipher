require File.join(File.dirname(__FILE__), 'spec_helper')

describe String, "extensions" do
  describe "#prepare_for_solitaire_encoding" do
    it "should turn a string into one which contains only the characters A-Z" do
      "Code in Ruby, live longer!".prepare_for_solitaire_encoding.should == "CODEINRUBYLIVELONGER"
    end
  end

  describe "#pad" do
    it "should turn a string into one with blocks of five characters separated with spaces" do
      "STRINGWITHPADDINGNEEDED".pad.should == "STRINGWITHPADDINGNEEDEDXX"

      "".pad.should == ""

      "X".pad.should == "XXXXX"
    end
  end

  describe "#to_block_form" do
    it "should turn a string into one with blocks of five characters separated with spaces" do
      "CODEINRUBYLIVELONGER".to_block_form.should == "CODEI NRUBY LIVEL ONGER"

      "SOMEOTHERSTRING".to_block_form.should == "SOMEO THERS TRING"

      "STRINGWITHPADDINGNEEDEDXX".to_block_form.should == "STRIN GWITH PADDI NGNEE DEDXX"

      "".to_block_form.should == ""

      "XXXXXX".to_block_form.should == "XXXXX"
    end
  end

  describe "#to_numeric_representation" do
    it "should represent A as an array containing 1" do
      "A".to_numeric_representation.should == [1]
    end

    it "should represent STRING as [19, 20, 18, 9, 14, 7]" do
      "STRING".to_numeric_representation.should == [19, 20, 18, 9, 14, 7]
    end
  end

  describe "from_numeric_representation" do
    it "should turn [1] into 'A'" do
      String.from_numeric_representation([1]).should == "A"
    end

    it "should be combinable with #to_numeric_representation to create the identity function" do
      String.from_numeric_representation("ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_numeric_representation).should == "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    end
  end
end