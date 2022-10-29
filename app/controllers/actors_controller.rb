class ActorsController < ApplicationController
  def index
    @actors = all.filter { |a| a.type == :device }
    @groups = all.filter { |a| a.type == :group }
  end

  private

  def all
    @all ||= Fritzbox::Smarthome::Heater.all
  end
end
