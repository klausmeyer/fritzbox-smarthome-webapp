class ActorsController < ApplicationController
  def index
    @groups  = Fritzbox::Smarthome::Actor.all(types: ['group']).sort_by(&:name)
    @devices = Fritzbox::Smarthome::Actor.all(types: ['device']).sort_by(&:name)
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
