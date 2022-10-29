Fritzbox::Smarthome.configure do |config|
  config.endpoint   = ENV['FRITZBOX_ENDPOINT'] || 'https://fritz.box'
  config.username   = ENV['FRITZBOX_USERNAME'] || 'smarthome'
  config.password   = ENV['FRITZBOX_PASSWORD'] || 'verysmart'
  config.verify_ssl = ENV['VERIFY_SSL'].in? %w(true 1 yes)
  config.logger     = Rails.logger if ENV['DEBUG'].in? %w(true 1 yes)
end

module Fritzbox::Smarthome
  TEMP_CELSIUS_OFF = 126.5 # This value indicates "OFF" state. 253/2
  TEMP_CELSIUS_MIN = 8.0
  TEMP_CELSIUS_MAX = 28.0

  TEMPERATURE_SCALE = [['OFF', TEMP_CELSIUS_OFF]] + (Fritzbox::Smarthome::TEMP_CELSIUS_MIN .. Fritzbox::Smarthome::TEMP_CELSIUS_MAX).step(0.5).map { |t| [t, t] }
end
