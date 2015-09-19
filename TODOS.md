# Next Step
## Essential
[] Set a sensible pg_password. How to communicate to the user?
[] Web Front End for ssh_key and env_var editing for user apps
[] Run a simple sinatra app
[] Deny ssh access for user - keep git push via ssh working
[] HTTPS-Setup for Web-Server. HTTPs Access only
[] Configure SSHd to deny failed logins (exponential back off)

## Low hanging fruits
[] Install bundler, rails, padrino, sinatra w/ root
  [] Create a list of gems which should be installed

## Nive to have
[] Run a simple padrino app
[] /opt/aris/config/aris.cfg with the most important paths
  # To run ansible after modification
  - ansible_bin_path:
  - aris_ansible_path:
  - aris_userfile_path:

## Done
[x] PostgresSQL-Access via rails app
[x] Aris util to create users.yml for aris
  # Actions for the util
  - aris-user add [name] --email --ssh-key
  - aris-user delete [name]
  - aris-user list
  # Steps:
  a) Load config defined in /opt/aris/config/aris.cfg
  b) Load list from users.yml or create users.yml and empyty list
  c) Modify list
  d) Store list (if add or delete)
  e) Commit changes via ansible (if add or delete)
  f) Print out current list (in any case)
