# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

remote_user = ENV['ANSIBLE_REMOTE_USER']

raise "You need to set ANSIBLE_REMOTE_USER in your shell" unless remote_user

# Give root-like permissions to remote_user
$create_user = <<SCRIPT
useradd -m -s /bin/bash -U #{remote_user}
echo "#{remote_user} ALL=NOPASSWD:ALL" | sudo tee /etc/sudoers.d/#{remote_user}
SCRIPT

# Enable wheel group in sudoers
$enable_wheel = <<SCRIPT
sed -i -e "s/^# %wheel/%wheel/" /etc/sudoers
SCRIPT

# Ensure ssh-access
$enable_ssh_access = <<SCRIPT
groupadd ssh-clients
usermod vagrant -G ssh-clients
SCRIPT

# Set local id_rsa.pub as authorized_key for remote_user
$add_authorized_key = <<SCRIPT
rm -f /home/#{remote_user}/.ssh/authorized_keys
mkdir /home/#{remote_user}/.ssh
cp /home/vagrant/host_pubkey /home/#{remote_user}/.ssh/authorized_keys
chown #{remote_user}:#{remote_user} /home/#{remote_user}/.ssh/authorized_keys
chmod 600 /home/#{remote_user}/.ssh/authorized_keys
SCRIPT

# Remove local id_rsa.pub from image
$remove_host_pubkey = <<SCRIPT
rm -f /home/vagrant/host_pubkey
echo "id_rsa.pub installed for user #{remote_user}"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "jessie" do |box|
    box.vm.box = "jessie"
    box.vm.network :private_network, ip: '192.168.42.31'
    box.vm.network :forwarded_port, guest: 80,   host: 8081
    box.vm.network :forwarded_port, guest: 5432, host: 8432
  end

  config.vm.provision 'file',
    run: 'once',
    source: '~/.ssh/id_rsa.pub',
    destination: '/home/vagrant/host_pubkey'

  config.vm.provision 'shell', privileged: true, run: 'once', inline: $create_user
  config.vm.provision 'shell', privileged: true, run: 'once', inline: $enable_wheel
  config.vm.provision 'shell', privileged: true, run: 'once', inline: $enable_ssh_access
  config.vm.provision 'shell', privileged: true, run: 'once', inline: $add_authorized_key
  config.vm.provision 'shell', privileged: true, run: 'once', inline: $remove_host_pubkey
end
