CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_ACCESS_CEACRET_KEY'],
    region: ENV['AWS_region']
  }
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  config.remove_previously_stored_files_after_update = false

  config.fog_directory = ENV['config_fog']
  config.asset_host = ENV['config_asset']
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/