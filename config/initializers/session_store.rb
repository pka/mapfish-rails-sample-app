# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mapfish-rails-sample-app_session',
  :secret      => '9d2315fa6f2b373efafc662dba36577e988c2655bc76ab7f4a3f8513a453ba6b3dc185ed159a69c63de1c7ebe3ffca0c98276de58ff16bada0bc9fa0fc31294e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
