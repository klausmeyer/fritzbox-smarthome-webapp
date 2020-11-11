module ActorsHelper
  TEMP_MIN = 8.0
  TEMP_MAX = 30.0

  def temperature_select(actor)
    select_tag(:hkr_temp_set, options_for_select(temperature_options, actor.hkr_temp_set.to_s),
      include_blank: false, class: 'form-control', data: { remote: true, method: :put, url: actor_path(id: actor.ain) }
    )
  end

  def temperature_options
    options = [['Off', Fritzbox::Smarthome::TEMP_VALUE_OFF.to_s]]

    (TEMP_MIN..TEMP_MAX).step(0.5) do |n|
      options << ["#{n} °C", n.to_s]
    end

    options
  end
end
