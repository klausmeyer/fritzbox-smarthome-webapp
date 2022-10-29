class HeatersController < ApplicationController
  def update
    actor.update_hkr_temp_set update_params.fetch(:hkr_temp_set).to_d

    redirect_to root_path
  end

  private

  def actor
    @actor ||= Fritzbox::Smarthome::Heater.new(ain: update_params.fetch(:ain))
  end

  def update_params
    params.require(:fritzbox_smarthome_heater).permit(:ain, :hkr_temp_set)
  end
end
