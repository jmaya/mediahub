# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'bento/centos-7.3'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

#  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
#  config.vm.provision "file", source: '~/.gitconfig', destination:"~/.gitconfig"
#  config.vm.provision "file", source: '~/.gitconfig.user', destination:"~/.gitconfig.user"
#  config.vm.provision "shell", inline: "sudo rm -f /etc/nginx/sites-enabled/default && sudo ln -s /vagrant/config/container/nginx-sites.conf /etc/nginx/sites-enabled/nginx-sites.conf && sudo service nginx restart"

 config.vm.provision "shell", inline: <<-SHELL
  yum install -y vim tmux
  curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | sudo bash
  groupadd hab
  useradd -g hab hab
  cat > /etc/systemd/system/hab.service << EOF
[Unit]
Description=The Habitat Supervisor

[Service]
ExecStart=/bin/hab sup run

[Install]
WantedBy=default.target
EOF
  systemctl enable hab
  systemctl start hab
  SHELL
end
