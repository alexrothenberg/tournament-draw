# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tournament_session',
  :secret      => '53e5233520e792a6d7cde1eadfdfff6fe188046ff2a0e1c9106f2e0f07621bd495785d488422650ea3054a4f575ad6c0239bf0799a6d30f059871b5b70949f03'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
