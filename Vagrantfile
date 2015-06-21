require 'yaml'
settings = YAML.load(IO.read('vagrant_secure_settings.yml'))

Vagrant.configure("2") do |config|
  config.vm.box = "dhoppe/debian-8.0.0-amd64-nocm"
  config.ssh.private_key_path = ["#{ENV['HOME']}/.ssh/id_rsa","#{ENV['HOME']}/.vagrant.d/insecure_private_key"]

  # Build blog platform
  config.vm.provider :vmware_fusion do |provider, override|
    provider.vmx["memsize"] = "1024"
    provider.vmx["mks.enable3d"] = "FALSE"
    provider.vmx["mks.vsync"] = "1"
    provider.gui = false
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
