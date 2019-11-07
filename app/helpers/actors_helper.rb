module ActorsHelper
  def switch_actor_off_link(actor)
    change_temperature_link 'OFF',actor, Fritzbox::Smarthome::TEMP_VALUE_OFF
  end

  def switch_actor_on_link(actor)
    value = if actor.hkr_temp_set > 0 && actor.hkr_temp_set < Fritzbox::Smarthome::TEMP_VALUE_OFF
      actor.hkr_temp_set
    else
      Fritzbox::Smarthome::TEMP_VALUE_ON
    end

    change_temperature_link 'ON', actor, value
  end

  def dec_temperature_link(actor)
    change_temperature_link '↓', actor, actor.hkr_temp_set - 0.5
  end

  def inc_temperature_link(actor)
    change_temperature_link '↑', actor, actor.hkr_temp_set + 0.5
  end

  def change_temperature_link(text, actor, value)
    link_to text, actor_path(id: actor.ain, hkr_temp_set: value), remote: true, method: :put, data: { 'disable-with': '...' }
  end
end
