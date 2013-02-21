$LOAD_PATH.unshift File.expand_path("../test_gem", __FILE__)

require 'version'
require 'hello'
require 'my_file'
require 'config_file_missing'

module TestGem

  puts "module TestGem defined"

end