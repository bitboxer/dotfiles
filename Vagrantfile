# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.network "private_network", ip: "192.168.23.33"
  config.vm.hostname = "vm"

  config.vm.synced_folder "~/mac_code", "/home/vagrant/mac_code", type: "nfs"
  config.vm.synced_folder "~/.gnupg", "/home/vagrant/.gnupg", type: "nfs"
  config.vm.synced_folder "~/Downloads", "/home/vagrant/Downloads", type: "nfs"

  config.vm.provider :virtualbox do |v|
    v.cpus = 4
    v.memory = 8056
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end
end
