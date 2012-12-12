load 'deploy'
# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'
load 'config/deploy' # remove this line to skip loading any of the default tasks

task :display_free_disk_space do
  run "df -h"
end

namespace :deploy do
	task :linkconfig do
		run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
	end
end
require "bundler/capistrano"
after "deploy:update_code", "deploy:linkconfig"

