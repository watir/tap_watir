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

  it '#swipe_to' do
    toggle_element = $app.element(accessibility_id: 'Toggle navigation').wait_until(&:present?)
    toggle_element.tap
    start_element = $app.element(accessibility_id: 'Sign in').wait_until(&:present?)
    end_element = $app.element(accessibility_id: 'Home (current)').wait_until(&:present?)
    # TODO: Find an app to use for swiping
    expect(start_element.swipe_to(end_element: end_element, duration: 3000).class).to be Appium::Core::TouchAction
  end

  it '#two_finger_tap' do
    toggle_element = $app.element(xpath: 'Toggle navigation').wait_until(&:present?)
    toggle_element.two_finger_tap
    menu_home_option = $app.element(accessibility_id: 'Home (current)')
    expect(menu_home_option.wait_until(&:present?)).to eq menu_home_option
  end
end
