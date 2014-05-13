VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "devbox.example.com"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet"
    puppet.manifest_file = "vagrant.pp"
    puppet.module_path = "puppet/modules"
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.box = "hashicorp/precise32"
  config.vm.network "forwarded_port", guest: 5984, host: 15984
  config.vm.network "forwarded_port", guest: 8080, host: 18080
  config.vm.network "forwarded_port", guest: 80, host: 10080
  config.vm.network "forwarded_port", guest: 3128, host: 13128
  config.vm.synced_folder "~/var/www", "/var/www", create: true
end
