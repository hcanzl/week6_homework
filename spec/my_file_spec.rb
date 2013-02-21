$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'yaml'
require 'test_gem'

describe TestGem::MyFile do
  
  it { TestGem.should be_a Module }
  
  it "::first returns the first line of file" do
    first_line = TestGem::MyFile.first "./spec/test_file.txt"
    first_line.should eq "The first line."
  end
  
  it "::last returns the last line of file" do
    last_line = TestGem::MyFile.last "./spec/test_file.txt"
    last_line.should eq "The last line."
  end
   
  it "::init_config write a default config file to current directory in YAML" do
    TestGem::MyFile.init_config

    File.exist?('config.yml').should eq true
  end
  
  it '::configure should raise a ConfigFileMissing when config file is missing' do
    if (File.exists?('config.yml'))
       File.delete('config.yml')
    end
    
    expect{ TestGem::MyFile.configure( { :default_file_name => 'config.yml' }) }.to raise_error(ConfigFileMissing)
  end
    
  it "::configure set @default_file_name and @supported_types from config hash" do
    TestGem::MyFile.init_config
    file = 'config.yml'
    types = ['txt', 'pdf', 'csv']

    TestGem::MyFile.configure({ :default_file_name => file })
    TestGem::MyFile.configure({ :supported_types => ['txt', 'pdf', 'csv'] })
    config_hash = File.open('config.yml', 'r') { |config_file| YAML.load(config_file) }

    config_hash[:default_file_name].should eq file
    config_hash[:supported_types].should eq types
  end
  
end