CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: 'kLWe9tG2z9D1/60clnLxG6kju7eowxiS72VwCngl',
    region: 'ap-northeast-1'
  }
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  config.remove_previously_stored_files_after_update = false

  config.fog_directory = 'rails-order'
  config.asset_host = 'https://577772581461.signin.aws.amazon.com/console'
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/