require 'carrierwave/storage/file'

if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
  end
else
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }
    
    config.fog_directory  = Rails.application.credentials.aws[:fog_directory]
    config.asset_host = Rails.application.credentials.aws[:asset_host]
    config.cache_storage = :fog
  end
end