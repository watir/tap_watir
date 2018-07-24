require 'spec_helper'

RSpec.describe TapWatir::App do
  it "delegates calls to driver" do
    expect($app.respond_to? :session_capabilities) #responds to it
    expect($app.session_capabilities).to be_a Selenium::WebDriver::Remote::W3C::Capabilities # match with the seleniums caps

  end

  describe "#element" do
    it 'returns a TapWatir Element' do
      expect($app.element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.widget.Button
")).to be_a TapWatir::Element #evaluates the instance of tap watir element

      # by evaluating an xpath element with the tapwatir::element should be true bc 'locate'
    end
  end
end
