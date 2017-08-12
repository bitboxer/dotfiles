# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.network "private_network", ip: "192.168.23.33"
  config.vm.hostname = "vm"

  config.vm.synced_folder "/Users/bodo/code", "/home/vagrant/code", type: "nfs"
  config.vm.synced_folder "/Users/bodo/.gnupg", "/home/vagrant/.gnupg", type: "nfs"

  config.vm.provider :virtualbox do |v|
    v.cpus = 4
    v.memory = 8056
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.verbose = "true"
  end
end
