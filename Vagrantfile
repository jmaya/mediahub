# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'bento/centos-7.4'
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

  sudo yum install -y yum-utils device-mapper-persistent-data lvm2
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  sudo yum install -y docker-ce
  systemctl enable docker
  systemctl start docker

  sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose



  SHELL
end
