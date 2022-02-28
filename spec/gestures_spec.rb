require 'rspec'

RSpec.describe TapWatir::Element do
  it '#tap' do
    toggle_element = $app.element(accessibility_id: 'Toggle navigation').wait_until(&:present?)
    toggle_element.tap
    menu_home_option = $app.element(accessibility_id: 'Home (current)')
    expect(menu_home_option.wait_until(&:present?)).to eq menu_home_option
  end

  it '#double_tap' do
    toggle_element = $app.element(accessibility_id: 'Toggle navigation').wait_until(&:present?)
    toggle_element.double_tap
    menu_home_option = $app.element(accessibility_id: 'Home (current)')
    menu_home_option.wait_while(&:present?)
    expect(menu_home_option.present?).to be_falsey
  end

  it '#two_finger_tap' do
    toggle_element = $app.element(accessibility_id: 'Toggle navigation').wait_until(&:present?)
    toggle_element.two_finger_tap
    sleep 20
  end

  it '#swipe_to' do
    toggle_element = $app.element(accessibility_id: 'Toggle navigation').wait_until(&:present?)
    toggle_element.swipe
    sleep 20
  end
end
