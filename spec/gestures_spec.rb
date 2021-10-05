require 'rspec'

RSpec.describe TapWatir::Element do
  it '#tap' do
    toggle_element = $app.element(accessibility_id: 'Toggle navigation').wait_until(&:present?)
    toggle_element.tap
    menu_home_option = $app.element(accessibility_id: 'Home (current)')
    expect(menu_home_option.wait_until(&:present?)).to eq menu_home_option
  end
end
