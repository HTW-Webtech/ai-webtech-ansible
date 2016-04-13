# HTW Aristoteles Ansible-Repo

This repo contains ansible playbooks and roles to bootstrap and configure an ecosystem
I juse for teaching "Web technologies". The ecosystem includes three main components:

- A rails-based admin-app to allowing students to manage their applications (TODO: add link to repo)
- Jenkins-CI to enable an automated test-environment to run against students applications (TODO: add schematic desc)
- A simple app-hosting service accessible via git-ssh (pub key auth) served via passenger/nginx


## Warning

This ecosystem is built for a *customized* debian 8 (jessie) and wont work on any
other system without extensive modifications.


# Getting started

Ensure `ansible`, `vagrant` and `ruby` are available to your shell.
- [Virtualbox](https://www.virtualbox.org/) Version 4+
- [Vagrant](https://www.vagrantup.com/) ([github](https://github.com/mitchellh/vagrant)), Version 1.7+
- [Ansible](http://www.ansible.com/) ([github](https://github.com/ansible/ansible)), Version 1.9+
- [Ruby](https://www.ruby-lang.org/en/) ([github](https://github.com/ruby/ruby)), Version 2.1+


# TODOS

- [ ] Use ansible.bootstrap-remote-user repo instead of custom code
- [ ] Jenkins Cron: Currently I enforce a jenkins restart after each job modifaction.
      A much better approach would be to just reload the job configuration files.

## Done

- [x] Jenkins job: bundle install > /dev/null 2>&1
- [x] HTTPS-Setup for Web-Server. HTTPs Access only
- [x] Fix issues with lots of users (Performance improved by introducing a processing file for all app/jenkins jobs)
- [x] Rakefile to update aris-cron on dev and prod (New command: `rake update_cron` and `rake prod:update_cron`
- [x] Finish capybara-poltergeist setup
- [x] switch command does not cd into app folder (The cd command has to be exec before opening a new subshell)
- [x] Aris-Cron MAILTO does not work yet (Fix was to enable TCP Port 857 on aris host)


# License

http://grekko.mit-license.org/
