Fritzbox::Smarthome.configure do |config|
  config.endpoint   = ENV['FRITZBOX_ENDPOINT'] || 'https://fritz.box'
  config.username   = ENV['FRITZBOX_USERNAME'] || 'smarthome'
  config.password   = ENV['FRITZBOX_PASSWORD'] || 'verysmart'
  config.verify_ssl = ENV['VERIFY_SSL'].in? %w(true 1 yes)
  config.logger     = Rails.logger if ENV['DEBUG'].in? %w(true 1 yes)
end
