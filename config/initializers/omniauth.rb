OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '412110575521736', '55a236183564d5f5b6313e89427953ab'
end