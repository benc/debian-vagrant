# Install the requirements:
#
# vagrant plugin install vagrant-digitalocean
#
require 'yaml'
settings = YAML.load(IO.read('vagrant_secure_settings.yml'))

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.ssh.private_key_path = ["#{ENV['HOME']}/.ssh/id_rsa","#{ENV['HOME']}/.vagrant.d/insecure_private_key"]

  # Build www.cochezconsult.be platform
  config.vm.provider :vmware_fusion do |provider, override|
    override.vm.box_url = 'http://files.vagrantup.com/precise64_vmware.box'
    provider.vmx["memsize"] = "1024"
    provider.gui = false
  end
 
  config.vm.provider :virtualbox do |provider, override|
    override.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'
    provider.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = settings['digital_ocean']['machines']['defaults']['private_key_path']
    override.ssh.username = settings['digital_ocean']['machines']['defaults']['username']

    override.vm.box = 'digital_ocean'
    override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'

    provider.client_id = settings['digital_ocean']['client_id']
    provider.api_key = settings['digital_ocean']['api_key']
    provider.image = settings['digital_ocean']['machines']['defaults']['image']
    provider.region = settings['digital_ocean']['machines']['defaults']['region']
    provider.name = "www.cochezconsult.be"
  end
  
  config.vm.define "blog" do |host|
    host.vm.network :forwarded_port, guest: 80, host: 30080
  end

  config.vm.provision :shell, inline: <<-SCRIPT
    printf "%s\n" "#{File.read("#{ENV['HOME']}/.ssh/id_rsa.pub")}" > /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh
  SCRIPT

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "site.yml"
    ansible.sudo = true
    ansible.host_key_checking = false
    ansible.verbose = 'v'
    if ENV['ANSIBLE_INVENTORY'].nil?
      ansible.inventory_path = "development"
    else
      ansible.inventory_path = ENV['ANSIBLE_INVENTORY']
    end
    ansible.limit = 'blog'
    if !ENV['ANSIBLE_TAG'].nil?
      ansible.tags = ENV['ANSIBLE_TAG']
    end
    unless ENV['ANSIBLE_INVENTORY'].nil?
      ansible.extra_vars = "secure_settings/#{ENV['ANSIBLE_INVENTORY']}.yml"
    end
  end
end
