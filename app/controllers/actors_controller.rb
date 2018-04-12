class ActorsController < ApplicationController
  def index
    @all_actors = Fritzbox::Smarthome::Actor.all
    @groups  = @all_actors.select { |a| a.type == :group }
    @devices = @all_actors.select { |a| a.type == :device }
    @devices_not_in_groups = @devices.reject { |a| a.id.in? @groups.map(&:group_members).flatten }
  end

  def update
    actor.update_hkr_temp_set BigDecimal.new(params.fetch(:hkr_temp_set))
    flash[:success] = t('.success')

    redirect_to action: :index
  end

  private

  def actor
    @actor ||= Fritzbox::Smarthome::Actor.new(ain: params.fetch(:id))
  end
end
