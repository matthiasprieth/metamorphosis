Metamorphosis::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  #fb -> APP:"Metamorphosis"
  ENV['FACEBOOK_APP_ID'] = "315173175265453"
  ENV['FACEBOOK_SECRET'] = "2645c64f28cbf8eef8a1078d16a795ff"

  # Code is not reloaded between requests
  config.cache_classes = true

  config.action_mailer.default_url_options = { :host => 'metamorphosis.mediacube.at' }
  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this) --> wtf Apache doesn't do anything
  #config.serve_static_assets = false
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
   config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # mal schauen ob das funkt!!!!??
  #config.action_mailer.raise_delivery_errors = false

  #only for local testing
  #config.action_mailer.default_url_options = { :host => 'http://localhost' }

  #only for local testing, cause localhost has no default smtp-server!
  #config.action_mailer.smtp_settings = {
      #enable_starttls_auto: true,
      #address: 'smtp.gmail.com',
      #port: 587,
      #authentication: 'plain',
      #user_name: '0815testemail@gmail.com',
      #password: '0815test'
  #}

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5
end
