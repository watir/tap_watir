RSpec.describe TapWatir do

  context "with Android" do

    it "opens Browser on Mobile Device" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: 'Android',
              platformVersion: '8.1',
              deviceName: 'Nexus',
              browserName: 'Chrome'}

      browser = TapWatir::MobileBrowser.new(url: opts[:url],
                                            desired_capabilities: opts)
      browser.goto "http://watir.com/"
      expect(browser.url).to eq "http://watir.com/"
      browser.close
    end

    it "opens Native/Hybrid App Locally" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: "Android",
              platformVersion: "8.1",
              deviceName: "Nexus",
              appWaitActivity: "com.address.book.MainActivity",
              app: "https://github.com/address-book/mobile_apps/blob/master/AddressBook.apk?raw=true"}

      app = TapWatir::App.new(caps: opts)
      expect(app.driver).to be_a(Appium::Core::Base::Driver)
      app.quit
    end

    it "opens Native App EmuSim" do
      opts = {platformName: "Android",
              platformVersion: "7.1",
              deviceName: "Android GoogleAPI Emulator",
              app: "https://github.com/address-book/mobile_apps/blob/master/AddressBook.apk?raw=true",
              name: "Hybrid application test using emu/sim",
              build: "TapWatir Tests",
              appWaitActivity: "com.address.book.MainActivity",
              url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
              sauce_username: ENV['SAUCE_USERNAME'],
              sauce_access_key: ENV['SAUCE_ACCESS_KEY']
      }

      app = TapWatir::App.new(caps: opts)
      expect(app.driver).to be_a(Appium::Core::Base::Driver)
      app.close
    end

    it "opens Native App Real Device Cloud" do
      opts = {testobject_api_key: "B5CC080A41984A94BF791F3275332A73",
              platformName: "Android",
              deviceName: "LG Nexus 5X",
              url: "https://us1.appium.testobject.com/wd/hub",
              appWaitActivity: "com.address.book.MainActivity"
      }

      app = TapWatir::App.new(caps: opts)

      expect(app.driver).to be_a(Appium::Core::Base::Driver)
      puts app.driver.window_size
      app.close
    end
  end

  context "with iOS" do
    it "opens Browser on Mobile Device" do
      opts = {
          url: 'http://localhost:4723/wd/hub',
          platformVersion: "11.4",
          deviceName: "iPhone X",
          platformName: "iOS",
          browserName: "Safari"
      }

      browser = TapWatir::MobileBrowser.new(url: opts[:url],desired_capabilities: opts)
      browser.goto "a.testaddressbook.com"
      expect(browser.title).to eq ("Address Book")
      browser.close

    end

    it "opens Native/Hybrid App Locally" do
      opts = {
          url: 'http://localhost:4723/wd/hub',
          platformVersion: "11.4",
          platformName: "iOS",
          deviceName: "iPhone X",
          app: "/Users/prakharrawat/Documents/Address_Book.ipa"
      }

      app = TapWatir::App.new(caps: opts)
      expect(app.driver).to be_a(Appium::Core::Base::Driver)
      app.quit
    end

    it "opens Native App EmuSim" do
      opts = {
          platformName: "iOS",
          platformVersion: "11.0",
          deviceName: "iPhone X Simulator",
          app: "sauce-storage:log.ipa",
          buildName: "Native and Hybrid test on iOS Sauce",
          url: "http://username:access_key@ondemand.saucelabs.com:80/wd/hub",
          name: "iOS Tests on EmuSIm",
          # browserName: "Safari",
          # appiumVersion: "1.6.2",
          sauce_username:   ENV['SAUCE_LABS'] ? ENV['SAUCE_USERNAME'] : nil,
          sauce_access_key: ENV['SAUCE_LABS'] ? ENV['SAUCE_ACCESS_KEY'] : nil,

      }
      newUrl = opts.delete(:url)
      app  = TapWatir::MobileBrowser.new(url:newUrl,desired_capabilities:opts)
      app.close
    end
    it "opens Native App Real Device Cloud" do

    end

  end

end
