require 'spec_helper'

RSpec.describe TapWatir do
  it "delegates calls to driver" do
    expect($app.respond_to? :session_capabilities) #responds to it
    expect($app.session_capabilities).to be_a Selenium::WebDriver::Remote::W3C::Capabilities # match with the seleniums caps

  end

end
