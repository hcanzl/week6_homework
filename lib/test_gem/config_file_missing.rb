$LOAD_PATH.unshift File.expand_path("../test_gem", __FILE__)

class ConfigFileMissing < IOError
end
