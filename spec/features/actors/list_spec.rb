require 'rails_helper'

RSpec.feature 'List Actors' do
  before do
    expect(Fritzbox::Smarthome::Heater).to receive(:all).and_return([group, device1, device2])
  end

  def build_actor(attributes = {})
    Fritzbox::Smarthome::Heater.new({
      id:                     1,
      type:                   :device,
      name:                   'Device',
      ain:                    '12345 678900',
      hkr_temp_is:            '19.5'.to_d,
      hkr_temp_set:           '21.5'.to_d,
      hkr_next_change_period: Time.now + 3.hours,
      hkr_next_change_temp:   '16.0'.to_d
    }.merge(attributes))
  end

  let(:group)   { build_actor(id: '1', type: :group,  name: 'My Group', group_members: %w(2 3)) }
  let(:device1) { build_actor(id: '2', type: :device, name: 'Device 1') }
  let(:device2) { build_actor(id: '3', type: :device, name: 'Device 2') }

  scenario 'Show a list of all Actors' do
    visit '/'

    expect(page).to have_text 'Group "My Group"'
    expect(page).to have_content 'Group Switch'
    expect(page).to have_content '19.5 °C'
    expect(page).to have_content '16.0 °C'
  end
end
