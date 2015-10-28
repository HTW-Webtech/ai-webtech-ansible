# HTW Aristoteles Ansible-Repo
TODO desc

# Getting started
Ensure `ansible`, `vagrant` and `ruby` are available to your shell.
- [Virtualbox](https://www.virtualbox.org/) Version 4+
- [Vagrant](https://www.vagrantup.com/) ([github](https://github.com/mitchellh/vagrant)), Version 1.7+
- [Ansible](http://www.ansible.com/) ([github](https://github.com/ansible/ansible)), Version 1.9+
- [Ruby](https://www.ruby-lang.org/en/) ([github](https://github.com/ruby/ruby)), Version 2.1+


# TODOS
- [ ] Use ansible.bootstrap-remote-user repo instead of custom code
- [ ] Add description

## Essential
- [ ] HTTPS-Setup for Web-Server. HTTPs Access only

## Bugs
waiting for them ;)

## Done
- [x] Fix issues with lots of users (Performance improved by introducing a processing file for all app/jenkins jobs)
- [x] Rakefile to update aris-cron on dev and prod (New command: `rake update_cron` and `rake prod:update_cron`
- [x] Finish capybara-poltergeist setup
- [x] switch command does not cd into app folder (The cd command has to be exec before opening a new subshell)
- [x] Aris-Cron MAILTO does not work yet (Fix was to enable TCP Port 857 on aris host)

# License
http://grekko.mit-license.org/
