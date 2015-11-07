desc 'Push changes to github'
task :push do
  sh "git push origin master"
end

desc 'Updates the aris-cron code for development'
task update_cron: [:push] do
  env = ENV.fetch('TARGET_ENV', 'development')
  cmd = "ansible-playbook playbooks/aris-server.yml -i inventories/#{env}.ini --tags=ansible-cron"
  puts "Running: #{cmd}"
  sh cmd
end

desc 'Updates the aris-cron code for production'
namespace :prd do
  task :update_cron do
    ENV['TARGET_ENV'] = 'production'
    Rake::Task['update_cron'].invoke
  end
end

task default: :push
