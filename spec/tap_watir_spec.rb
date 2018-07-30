require 'spec_helper'
require 'tap_watir/element'

RSpec.describe TapWatir::App do
  it "delegates calls to driver" do
    expect($app.respond_to? :session_capabilities)
    expect($app.session_capabilities).to be_a Selenium::WebDriver::Remote::W3C::Capabilities

  end

  describe "#element" do
    it 'returns a TapWatir Element' do
      expect($app.element(id: "android:id/statusBarBackground")).to be_a TapWatir::Element
    end
    it 'checks if the element exists' do
      expect($app.element(id: "android:id/statusBarBackground")).to exist
    end
    it 'checks if the element is present' do
      expect($app.element(id: "android:id/statusBarBackground")).to be_present
    end
  end
end
