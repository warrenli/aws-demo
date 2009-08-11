# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_movies_service_session',
  :secret      => 'f93c1c59d5b5c7484d72c66fc2ae91adc7906fa9c96a63917c03b2d122222119b1e3cc95494733a95586d4f5866c01ae133f80a0c1d3111fdca697e3c5c60bca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
