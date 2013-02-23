$LOAD_PATH.unshift File.expand_path("../test_gem", __FILE__)

require 'yaml'

module TestGem
  
  class MyFile
    puts "class #{self} defined"
    
    def self.first input_file
      f = File.open input_file
      f.gets.chomp
    end
    
    def self.last input_file
      f = File.open input_file
      f.readlines[-1].chomp
    end
    
    def self.init_config filename
      default_config = { :default_file_name => 'default_file.txt', :supported_types => ['txt', 'pdf'] }
      
      File.open(filename, 'w') { |config_file| YAML.dump(default_config, config_file) }
      
    end
    
    def self.read_config filename
      raise ConfigFileMissing unless File.exists?(filename)
            
      File.open(filename, 'r') { |config_file| YAML.load(config_file) }
    end
    
    def self.configure config_hash
      config_str = ""
      config_str.concat("Configuration Values:\n")
      config_hash.each { |key, value|
        config_str.concat("#{ key } = #{ value }\n")
      }
      
      puts config_str
      return config_str
    end
    
  end
end