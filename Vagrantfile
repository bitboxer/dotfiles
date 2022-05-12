# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.network :private_network, ip: "192.168.56.33"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3001, host: 3001
  config.vm.network :forwarded_port, guest: 3035, host: 3035
  config.vm.network :forwarded_port, guest: 4000, host: 4000
#  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 6060, host: 6060
  config.vm.network :forwarded_port, guest: 8080, host: 8088

  config.ssh.forward_agent = true
#  config.ssh.forward_x11 = true

  config.vm.hostname = "vm"

  config.vm.synced_folder "/Users/bitboxer/code", "/home/vagrant/mac_code", type: "nfs"
  config.vm.synced_folder "/Users/bitboxer/Downloads", "/home/vagrant/Downloads", type: "nfs"
  config.vm.synced_folder "/Users/bitboxer/.gnupg", "/home/vagrant/.gnupg", type: "rsync", rsync__exclude: ["S.gpg-agent.*", "gpg-agent.conf"]

  config.vm.provider :virtualbox do |v|
    v.cpus = 4
    v.memory = 4556
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
  config.persistent_storage.location = "~/code/vagrant.vdi"
  config.persistent_storage.size = 20_000
  config.persistent_storage.mountname = "persistant"
  config.persistent_storage.filesystem = "ext4"
  config.persistent_storage.mountpoint = "/home/vagrant/persistant"
  config.persistent_storage.volgroupname = "persistantgroup"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.install_mode = "pip"
    ansible.pip_install_cmd = "sudo apt-get install -y python3-distutils && curl -s https://bootstrap.pypa.io/get-pip.py | sudo python3"
  end
end
