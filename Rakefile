desc 'Updates the aris-cron code for development'
task :update_cron do
  env = ENV.fetch('TARGET_ENV', 'development')
  sh "git push origin master"
  cmd = "ansible-playbook playbooks/aris-server.yml -i inventories/#{env}.ini --tags=aris-cron"
  puts "Running: #{cmd}"
  sh cmd
end

desc 'Updates the aris-cron code for production'
namespace :prod do
  task :update_cron do
    ENV['TARGET_ENV'] = 'production'
    Rake::Task['update_cron'].invoke
  end
end
