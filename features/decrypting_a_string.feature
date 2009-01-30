Feature: Decrypting a string
  As an agent at the headquarters of an intelligence operation
  I want to decrypt a piece of text that has been sent by one of our agents
  So that I can understand the threat to our national security

  Scenario: decode a string with a cipher text
    Given the key stream "DWJXH YRFDG TMSHP UURXJ"
    When I decode the string "GLNCQ MJAFF FVOMB JIYCB"
    Then it should produce the plain text "CODEI NRUBY LIVEL ONGER"