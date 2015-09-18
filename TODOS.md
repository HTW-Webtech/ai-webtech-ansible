# Next Step
## Essential
[] PostgresSQL-Access via rails app
[] Run a simple sinatra app
[] Deny ssh access for user - keep git push via ssh working
[] /opt/aris/config/aris.cfg with the most important paths
  # To run ansible after modification
  - ansible_bin_path:
  - aris_ansible_path:
  - aris_userfile_path:
[] Aris util to create users.yml for aris
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
[] Web Front End for ssh_key config

## Nive to have
[] Run a simple padrino app
[] Install bundler, rails, padrino, sinatra w/ root
   List of gems for users
