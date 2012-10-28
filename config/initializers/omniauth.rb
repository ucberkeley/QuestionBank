Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET']
  provider :twitter, 'qcHsSNwiktUsMXqV58CwA', 'KiDTjPMiXZQZU14tX3HQMl8eFXzoRlLOkroBE1ouOU'
end
