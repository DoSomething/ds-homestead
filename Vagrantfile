VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/scripts/homestead.rb'

# Languages and Packages
ruby_version          = "latest" # Choose what ruby version should be installed (will also be the default version)
ruby_gems             = [        # List any Ruby Gems that you want to install
  "bundler",
]


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  Homestead.configure(config, YAML::load(File.read(path + '/Homestead.yaml')))

  # Install Ruby Version Manager (RVM)
  config.vm.provision "shell", path: path + "/scripts/rvm.sh", privileged: false, args: ruby_gems.unshift(ruby_version)

end