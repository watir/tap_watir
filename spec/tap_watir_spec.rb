require 'spec_helper'

RSpec.describe TapWatir do
  describe "Delegation" do
    it "returns device" do
      expect($app.respond_to? :session_capabilities).to eq true
      expect($app.session_capabilities).to be_a(Selenium::WebDriver::Remote::W3C::Capabilities)
    end
  end
end
