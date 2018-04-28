# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 4000, host: 4000
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.network "private_network", ip: "192.168.23.33"
  config.vm.hostname = "vm"

  config.vm.synced_folder "~/code", "/home/vagrant/mac_code", type: "nfs"
  config.vm.synced_folder "~/Downloads", "/home/vagrant/Downloads", type: "nfs"
  config.vm.synced_folder "~/.gnupg", "/home/vagrant/.gnupg", type: "rsync", rsync__exclude: ["S.gpg-agent.*", "gpg-agent.conf"]

  config.vm.provider :virtualbox do |v|
    v.cpus = 4
    v.memory = 3056
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]

    # Compare the time every 10 seconds
    v.customize [
      "guestproperty",
      "set",
      :id,
      "/VirtualBox/GuestAdd/VBoxService/--timesync-interval",
      "10000"
    ]
  end

  config.persistent_storage.enabled = true
  config.persistent_storage.location = "~/code/vagrant_persistant.vdi"
  config.persistent_storage.size = 10_000
  config.persistent_storage.mountname = "persistant"
  config.persistent_storage.filesystem = "ext4"
  config.persistent_storage.mountpoint = "/home/vagrant/persistant"
  config.persistent_storage.volgroupname = "persistantgroup"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.install_mode = "pip"
  end
end
