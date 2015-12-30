# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
remote_user = ENV['ANSIBLE_REMOTE_USER'] or raise("You need to set ANSIBLE_REMOTE_USER in your shell")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'jessie'
  config.hostsupdater.aliases = %w(
    portal.jessie
    jenkins.jessie
    admin.jessie
    files.jessie
    gitlist.jessie
  )
  config.vm.box = 'jessie'

  config.vm.network :private_network, ip: '192.168.3.10'

  # TODO: This may better be baked in a concrete box
  config.vm.provision 'file', # HTW Firewall config skript
    run: 'once',
    source: 'setup/firewall.sh',
    destination: '/tmp/firewall.sh'

  config.vm.provision 'shell', privileged: true, run: 'once', inline: <<-BASH
    mv /tmp/firewall.sh /root/firewall.sh
  BASH

  config.vm.provision 'file',
    run: 'once',
    source: '~/.ssh/id_rsa.pub',
    destination: '/home/vagrant/host_pubkey'

  # Create remote user w/ sudo rights
  config.vm.provision 'shell', privileged: true, run: 'once', inline: <<-BASH
    useradd -m -s /bin/bash -U #{remote_user}
    echo "#{remote_user} ALL=NOPASSWD:ALL" | sudo tee /etc/sudoers.d/#{remote_user}
  BASH

  # TODO: Dont know what that does
  config.vm.provision 'shell', privileged: true, run: 'once', inline: <<-BASH
    sed -i -e "s/^# %wheel/%wheel/" /etc/sudoers
  BASH

  # Enable SSH access
  config.vm.provision 'shell', privileged: true, run: 'once', inline: <<-BASH
    groupadd ssh-clients
    usermod vagrant -G ssh-clients
  BASH

  # Enable public key ssh access
  config.vm.provision 'shell', privileged: true, run: 'once', inline: <<-BASH
    rm -f /home/#{remote_user}/.ssh/authorized_keys
    mkdir -p /home/#{remote_user}/.ssh
    cp /home/vagrant/host_pubkey /home/#{remote_user}/.ssh/authorized_keys
    chown -R #{remote_user}:#{remote_user} /home/#{remote_user}/.ssh
    chmod -R 700 /home/#{remote_user}/.ssh
    rm -f /home/vagrant/host_pubkey
    echo "id_rsa.pub installed for user #{remote_user}"
  BASH
end
