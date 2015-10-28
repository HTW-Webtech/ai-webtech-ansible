# HTW Aristoteles Ansible-Repo
TODO desc

# TODOS
- [ ] Use ansible.bootstrap-remote-user repo instead of custom code
- [ ] Add description

## Essential
- [ ] HTTPS-Setup for Web-Server. HTTPs Access only

## Bugs
Waiting for them ;)

## Done
- [x] Fix issues with lots of users (Performance improved by introducing a processing file for all app/jenkins jobs)
- [x] Rakefile to update aris-cron on dev and prod (New command: `rake update_cron` and `rake prod:update_cron`
- [x] Finish capybara-poltergeist setup
- [x] switch command does not cd into app folder (The cd command has to be exec before opening a new subshell)
- [x] Aris-Cron MAILTO does not work yet (Fix was to enable TCP Port 857 on aris host)

# License
http://grekko.mit-license.org/
