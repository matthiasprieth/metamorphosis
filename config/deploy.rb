 require "bundler/capistrano"
 set :application, "metamorphosis"
 set :scm, :git
 set :repository,  "ssh://fhs33735@repos.mediacube.at/opt/git/web_2012/metamorphosis.git/"
 set :deploy_to, "/var/www/virthosts/metamorphosis.mediacube.at"
 set :user, "deploy_metam"
 set :branch, "master"

 set :bundle_flags,    "--quiet"   # do not run with --deployment,
                                   # this will generate a new Gemfile.lock on the server
 default_run_options[:pty] = true
 set :use_sudo, false
 set :port, 5412
 role :web, "multimediaart.at"                   # Your HTTP server, Apache/etc
 role :app, "multimediaart.at"                   # This may be the same as your `Web` server
 role :db,  "multimediaart.at", :primary => true # This is where Rails migrations will run
 # role :db,  "your slave db-server here