# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "chef/ubuntu-14.04"
    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = 1024
        vb.cpus = 1
        vb.customize ['modifyvm', :id, '--usb', 'on']
    end  
    # Add a shared folder for Saltstack states
    config.vm.synced_folder "salt/roots/", "/srv/salt/"

    if File.file?('default.yml')
        params = YAML.load_file 'default.yml'
        if params.is_a?(Hash) and params.has_key?('directories')
            params['directories'].each do |key, dir|
                puts "Custom synced directory #{key} : #{dir['host']}"
                config.vm.synced_folder "#{dir['host']}", "#{dir['guest']}"
            end
        end
    end

    config.vm.provision :salt do |salt|
        salt.minion_config = "salt/minion"
        salt.run_highstate = true
        salt.verbose = true
    end
end



