# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  #config.vm.synced_folder "manifests", "/tmp/manifests", "tests"
  config.vm.synced_folder "./", "/etc/puppet/modules/java"

  config.vm.define :java do |m|
    m.vm.box = "centos64"
    m.vm.box_url = "https://dl.dropboxusercontent.com/u/1075709/box/centos64.box"

    m.vm.hostname = 'test'
    m.vm.provider :vmware_fusion do |v|
      v.vmx["displayName"] = "java"
      v.vmx["memsize"] = 512
      v.vmx["numvcpus"] = 4
    end

    m.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.module_path    = "spec/fixtures/modules/"
      puppet.manifest_file  = ENV['VAGRANT_MANIFEST'] || "init.pp"
    end
  end
end
