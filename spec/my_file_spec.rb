$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'yaml'
require 'test_gem'

describe TestGem::MyFile do
  
  FILENAME = 'config.yml'
  
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
    TestGem::MyFile.init_config FILENAME

    File.exist?(FILENAME).should eq true
  end

  it "::read_config raise ConfigFileMissing exception when config file is missing" do
    if (File.exists?(FILENAME))
       File.delete(FILENAME)
    end
    
    expect{ TestGem::MyFile.read_config FILENAME}.to raise_error(ConfigFileMissing)
  end
  
  it "::read_config dump configuration file content to a hash and returns it" do
    expected_config_hash = { :default_file_name => 'default_file.txt', :supported_types => ['txt', 'pdf'] }
    TestGem::MyFile.init_config FILENAME
    
    TestGem::MyFile.read_config(FILENAME).should eq expected_config_hash
  end
   
  it "::configure displays configuration file content" do
    expected_config_string = "Configuration Values:\ndefault_file_name = default_file.txt\n" \
                              + "supported_types = [\"txt\", \"pdf\"]\n"
    
    TestGem::MyFile.init_config FILENAME 
    printed_config = TestGem::MyFile.configure(TestGem::MyFile.read_config FILENAME)
    
    printed_config.should eq expected_config_string
  end
  
end