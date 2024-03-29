lock '3.2.1'

set :application, 'miser'
set :repo_url, 'git@github.com:cintrzyk/miser.git'

set :rbenv_custom_path, '/usr/local/rbenv'
set :rbenv_ruby, '2.1.2'

set :pty, true
set :sudo_prompt, ""
set :linked_files, %w{
  config/secrets.yml
  config/unicorn.rb
  config/unicorn_init.sh
}
set :linked_dirs, %w{ tmp/pids log }
set :deploy_to, "/home/#{fetch(:application)}/production"
set :scm, :git
set :tmp_dir, "/home/#{fetch(:application)}/tmp"

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:web) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end
  before :starting, :check_revision

  %w{start stop restart}.each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app) do
        execute "service unicorn_#{fetch(:application)} #{command}"
      end
    end
  end
  after :finishing, :restart
end
