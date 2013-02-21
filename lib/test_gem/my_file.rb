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
    
    def self.init_config
      config_file = File.open('config.yml', 'w')
      YAML.dump({ :default_file_name => 'default_file.txt', :supported_types => ['txt', 'pdf'] }, config_file)
      config_file.close
    end
    
    def self.configure new_config_hash 
      raise ConfigFileMissing unless File.exists?('config.yml')
      
      current_config = File.open('config.yml', 'r') { |config_file| YAML.load(config_file)}
   
      new_config_hash.each { |key, value|
        current_config[key] = value
      }
      
      config_file = File.open('config.yml', 'w')
      YAML.dump(current_config, config_file)
      config_file.close
    end
    
  end
end