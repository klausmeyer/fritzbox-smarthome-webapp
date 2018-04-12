require 'rails_helper'

RSpec.feature 'List Actors' do
  before do
    expect(Fritzbox::Smarthome::Actor).to receive(:all)
      .with(types: %w(group)).and_return([actor1])
    expect(Fritzbox::Smarthome::Actor).to receive(:all)
      .with(types: %w(device)).and_return([actor2])
  end

  let(:actor1) do
    instance_double('Fritzbox::Smarthome::Actor',
      type:                   :group,
      name:                   'Group 1',
      ain:                    '12345 678900',
      hkr_temp_is:            '19.5'.to_d,
      hkr_temp_set:           '21.5'.to_d,
      hkr_next_change_period: Time.now + 3.hours,
      hkr_next_change_temp:   '16.0'.to_d
    )
  end

  let(:actor2) do
    instance_double('Fritzbox::Smarthome::Actor',
      type:                   :device,
      name:                   'Device 1',
      ain:                    '12345 678901',
      hkr_temp_is:            '19.5'.to_d,
      hkr_temp_set:           '21.5'.to_d,
      hkr_next_change_period: Time.now + 3.hours,
      hkr_next_change_temp:   '16.0'.to_d
    )
  end


  scenario 'Show a list of all Actors' do
    visit '/'

    expect(page).to have_text 'Devices'
    expect(page).to have_content '19.5 °C'
    expect(page).to have_content '16.0 °C'
  end
end
