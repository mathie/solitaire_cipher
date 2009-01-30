spec = Gem::Specification.new do |s|
  s.name              = 'solitaire_cipher'
  s.version           = '1.0.0'
  s.date              = "2009-01-30"
  s.author            = 'Graeme Mathieson'
  s.email             = 'mathie@rubaidh.com'
  s.has_rdoc          = true
  s.rubyforge_project = "rubaidh"
  s.homepage          = 'http://github.com/mathie/solitaire_cipher/'
  s.summary           = "Solitaire Cipher encoder and decoder."

  s.description = "A simple ruby gem for encoding and decoding strings " +
  "using the Solitaire Cipher."

  s.files = %w(
    MIT-LICENSE README.rdoc Rakefile solitaire_cipher.gemspec
    features/decrypting_a_string.feature
    features/encrypting_a_string.feature
    features/step_definitions/solitaire_cipher.rb
    features/support/env.rb
    lib/solitaire_cipher.rb
    spec/solitaire_cipher_spec.rb
    spec/spec_helper.rb
  )

  s.add_dependency 'actionpack'
  s.add_dependency 'activesupport'
end
