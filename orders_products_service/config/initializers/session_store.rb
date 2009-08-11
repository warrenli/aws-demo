# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orders_products_service_session',
  :secret      => '1864faac8dae55e55f73417ccaf0e1e62894ea05f859c98f98ab103800643f1a1ad260bcf2e91ba87e1cb5778f5074894d336c82fe9333ae7fe0515202c67963'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
