# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "boxname"
  config.vm.network :private_network, ip: "192.168.0.161"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.box_check_update = true
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root", :nfs => true

  # Set the Timezone to something useful
  config.vm.provision :shell, :inline => "echo \"Europe/Istanbul\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end