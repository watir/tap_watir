RSpec.describe TapWatir do
  it "opens Chrome" do
    appium_url = 'http://localhost:4723/wd/hub'
    caps = {platformName: 'Android',
            platformVersion: '8.1',
            deviceName: 'Nexus',
            browserName: 'Chrome'}

    browser = TapWatir::App.browser(url: appium_url, desired_capabilities: caps)
    browser.goto "http://watir.com/"
    expect(browser.url).to eq "http://watir.com/"
    browser.close
  end
end
