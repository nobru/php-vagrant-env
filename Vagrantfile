chef_repo = "#{Dir.pwd}/chef"

unless File.exists? "#{chef_repo}/Berksfile"
  raise 'Unable to find Berksfile.'
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # berkshelf
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "#{chef_repo}/Berksfile"

  config.omnibus.chef_version = :latest

  # box
  config.vm.box = "ubuntu/trusty64"

  # network
  config.vm.network "private_network", ip: "10.0.0.123"

  # share
  config.vm.synced_folder ".", "/vagrant"

  #virtualbox
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  # chef
  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "#{chef_repo}/roles"

    chef.run_list = [
      'role[web]'
    ]
  end

end
