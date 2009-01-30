Given /^the key stream "(.*)"$/ do |key_stream|
  @solitaire = SolitaireCipher.new(key_stream)
end

When /^I decode the string "(.*)"$/ do |encoded_string|
  @decoded_string = @solitaire.decode(encoded_string)
end

Then /^it should produce the plain text "(.*)"$/ do |plain_text_string|
  @decoded_string.should == plain_text_string
end

When /^I encode the string "(.*)"$/ do |plain_text_string|
  @encoded_string = @solitaire.encode(plain_text_string)
end

Then /^it should produce the cipher text "(.*)"$/ do |encoded_string|
  @encoded_string.should == encoded_string
end
