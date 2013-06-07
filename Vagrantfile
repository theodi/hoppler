# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  
  config.vm.network :forwarded_port, guest: 3030, host: 3306
  config.vm.network :private_network, :ip => "22.22.22.22"
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    
    chef.json = {
        "mysql" => {
            "bind_address" => "22.22.22.22",
            "server_debian_password" => "secritth1ngs",
            "server_root_password" => "secritth1ngs",
            "server_repl_password" => "secritth1ngs",
            "allow_remote_root" => true
        }
    }
    
    chef.add_recipe("apt")
    chef.add_recipe("mysql::server")
  end
end
