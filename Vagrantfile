VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/scripts/homestead.rb'


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  Homestead.configure(config, YAML::load(File.read(path + '/Homestead.yaml')))

  config.vm.box_version	= "0.4.4"

  config.vm.provision "shell", path: path + "/scripts/customizations.sh"

  config.vm.provision "shell", path: path + "/scripts/mongodb.sh"

  config.vm.network "forwarded_port", guest: 27017, host: 27017

end
