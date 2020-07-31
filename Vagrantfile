# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "rbox"
  config.vm.box = "centos/8"

  config.vm.network :private_network, ip: "10.0.1.13"

  config.vm.synced_folder "../", "/host", type: "nfs"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
    # vb.customize ["modifyvm", :id, "--usb", "on"]
    # vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "USB Serial", "--productid", "0x7523"]
  end

  config.vm.provision "ansible" do |an|
    an.playbook = "playbook.yml"
  end

  config.ssh.forward_agent = true
  config.ssh.keep_alive = true
end
