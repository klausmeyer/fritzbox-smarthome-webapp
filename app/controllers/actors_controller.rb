class ActorsController < ApplicationController
  def index
    @all_actors = Fritzbox::Smarthome::Heater.all
    @groups  = @all_actors.select { |a| a.type == :group }
    @devices = @all_actors.select { |a| a.type == :device }
    @devices_not_in_groups = @devices.reject { |a| a.id.in? @groups.map(&:group_members).flatten }
  end

  def update
    actor.update_hkr_temp_set params.fetch(:hkr_temp_set).to_d

    redirect_to action: :index
  end

  private

  def actor
    @actor ||= Fritzbox::Smarthome::Heater.new(ain: params.fetch(:id))
  end
end
