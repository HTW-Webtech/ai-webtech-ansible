desc 'Push changes to github'
task :push do
  sh "git push origin master"
end

namespace :update_cron do
  desc 'Updates the aris-cron code for development'
  task :dev do
    ENV['TARGET_ENV'] = 'development'
    Rake::Task['update_cron:run'].invoke
  end

  desc 'Updates the aris-cron code for production'
  task :prd do
    ENV['TARGET_ENV'] = 'production'
    Rake::Task['update_cron:run'].invoke
  end

  task run: [:push] do
    env = ENV.fetch('TARGET_ENV')
    cmd = "ansible-playbook playbooks/aris-server.yml -i inventories/#{env}.ini --tags=ansible-cron"
    puts "Running: #{cmd}"
    sh cmd
  end
end

task default: 'update_cron:dev'
