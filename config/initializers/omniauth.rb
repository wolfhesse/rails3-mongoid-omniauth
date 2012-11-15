Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET']
  provider :facebook, ENV['OMNI_FB_APP'],ENV['OMNI_FB_SECRET']

end
