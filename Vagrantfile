# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty32'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
  config.vm.provision "file", source: '~/.gitconfig', destination:"~/.gitconfig"
  config.vm.provision "file", source: '~/.gitconfig.user', destination:"~/.gitconfig.user"
end
