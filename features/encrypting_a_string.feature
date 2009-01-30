Feature: Encrypting a string
  As a counter-intelligence spy
  I want to encrypt a piece of text
  So that I can securely send it to headquarters

  Scenario: encode a string with a cipher text
    Given the key stream "DWJXH YRFDG TMSHP UURXJ"
    When I encode the string "Code in Ruby, live longer!"
    Then it should produce the cipher text "GLNCQ MJAFF FVOMB JIYCB"