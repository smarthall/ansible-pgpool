# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hansode/centos-6.5-x86_64"

  config.vm.define 'postgres-1' do |machine|
    machine.vm.hostname = 'postgres-1'
    machine.vm.network 'private_network', ip: "192.168.77.10"
  end
  config.vm.define 'postgres-2' do |machine|
    machine.vm.hostname = 'postgres-2'
    machine.vm.network 'private_network', ip: "192.168.77.11"
  end
  config.vm.define 'postgres-3' do |machine|
    machine.vm.hostname = 'postgres-3'
    machine.vm.network 'private_network', ip: "192.168.77.12"
  end

  config.vm.define 'lb-1' do |machine|
    machine.vm.hostname = 'lb-1'
	machine.vm.network 'private_network', ip: "192.168.77.254"
	machine.vm.network 'forwarded_port', guest: 5432, host: 5432

    machine.vm.provision :ansible do |ansible|
      ansible.playbook = "all.yml"
      ansible.limit = "all"
      ansible.sudo = true
      ansible.groups = {
        "postgres" => ["postgres-1", "postgres-2", "postgres-3"],
		"lb" => ["lb-1"],
      }
    end
  end
end
