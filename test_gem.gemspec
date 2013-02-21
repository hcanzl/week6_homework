$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'test_gem'

# TODO: Below, change the gem name, authors, and email

Gem::Specification.new do |s|
  s.name        = 'hcanzl_test_gem'
  s.version     = TestGem::VERSION
  s.date        = '2013-02-07'
  s.summary     = "Making a Test Gem"
  s.description = "A gem to explain how to make gems"
  s.authors     = ["Helen Canzler"]
  s.email       = 'hcanzl@hotmail.com'
  s.homepage    = 'http://rubygems.org/gems/test_gem'
  s.files       = ["lib/test_gem.rb", "lib/test_gem/version.rb", "lib/test_gem/hello.rb", "lib/test_gem/my_file.rb", "lib/test_gem/config_file_missing.rb"]
  s.executables << 'test_gem'
end