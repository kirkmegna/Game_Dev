# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_game_session',
  :secret      => '721ba6909ff85baee5bd740da04a712f6e6e1ad418ad74205df1360a89571f2456c64ebd5e263824303d50dd5c3e3656cd0e904941709322bc3542c90d1f5a1e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
