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





  RSpec.describe TapWatir do
    it 'should be able to open android application notes and do stuff' do
      appium_url = 'http://localhost:4723/wd/hub'
      caps = {platformName: 'Android',
              platformVersion: '8.1',
              deviceName: 'Nexus',
              app: '/Users/prakharrawat/Document/notes.apk'

      }
driver = TapWatir::App.browser(url:appium_url,desired_capabilities:caps)
      driver.element(xpath: '/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.support.v4.widget.DrawerLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.LinearLayout[2]/android.widget.Button
').click()

      driver.element(xpath: '/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.EditText
').send_keys("This is the title of the note")

      driver.element(xpath: '/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.EditText
').send_keys "This is the body of the note"

      # driver.quit

    end
  end
end
