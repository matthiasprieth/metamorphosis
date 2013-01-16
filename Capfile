load 'deploy'
# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'
load 'config/deploy' # remove this line to skip loading any of the default tasks

task :display_free_disk_space do
  run "df -h"
end

#namespace :deploy do
#desc "Remove mingw32 extensions from Gemfile.lock to re-bundle under LINUX"
#task :rm_mingw32, :except => { :no_release => true }, :role => :app do
#  puts " modifying Gemfile.lock ... removing mingw32 platform ext. before re-bundling on LINUX"
#  run "sed 's/-x86-mingw32//' #{release_path}/Gemfile.lock > #{release_path}/Gemfile.tmp && mv #{release_path}/Gemfile.tmp #{release_path}/Gemfile.lock"
#  run "sed -n '/PLATFORMS/ a\ ruby' #{release_path}/Gemfile.lock"
#end
#end
#before("bundle:install", "deploy:rm_mingw32")

namespace :deploy do
	task :linkconfig do
		run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
	end
end
require "bundler/capistrano"
after "deploy:update_code", "deploy:linkconfig"

