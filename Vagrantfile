# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty32'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
  config.vm.provision "file", source: '~/.gitconfig', destination:"~/.gitconfig"
  config.vm.provision "file", source: '~/.gitconfig.user', destination:"~/.gitconfig.user"
  config.vm.provision "shell", inline: "sudo rm -f /etc/nginx/sites-enabled/default && sudo ln -s /vagrant/config/container/nginx-sites.conf /etc/nginx/sites-enabled/nginx-sites.conf && sudo service nginx restart"
end
