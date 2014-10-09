Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Figaro.env.omniauth_google_client_id, Figaro.env.omniauth_google_client_secret
end