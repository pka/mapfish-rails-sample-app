# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_skel_session',
  :secret      => '4bda5a1831febf72e8f4a4c47c846a2106bf85ff64f17843cd7511f99d35022353bdca49fff9eb4d473bc9963c25ac7888b9c17dfb6a84276783c5c3631c8586'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
