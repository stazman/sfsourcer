Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

    OmniAuth.config.allowed_request_methods = [:post, :get]
    
end

# OmniAuth.config.logger = Rails.logger
# Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, Rails.application.secrets.facebook_app_id,
#  Rails.application.secrets.facebook_app_secret, scope: 'public_profile', info_fields: 'id,name,image,link'
# end