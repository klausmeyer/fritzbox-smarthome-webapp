Fritzbox::Smarthome.configure do |config|
  config.endpoint   = ENV['FRITZBOX_ENDPOINT'] || 'https://fritz.box'
  config.username   = ENV['FRITZBOX_USERNAME'] || 'smarthome'
  config.password   = ENV['FRITZBOX_PASSWORD'] || 'verysmart'
  config.verify_ssl = ENV['VERIFY_SSL'].in? %w(true 1 yes)
  config.logger     = Rails.logger if ENV['DEBUG'].in? %w(true 1 yes)
end

module Fritzbox::Smarthome
  TEMP_VALUE_OFF = 126.5 # This value indicates "OFF" state. 253/2
  TEMP_VALUE_ON  = 16.0
end
