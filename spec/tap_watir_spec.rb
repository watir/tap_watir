RSpec.describe TapWatir do
  context "with Android" do
    it "opens Browser on Mobile Device" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: 'Android',
              platformVersion: '8.1',
              deviceName: 'Nexus',
              browserName: 'Chrome'}

      browser = TapWatir::MobileBrowser.new(opts)
      browser.goto "http://watir.com/"
      expect(browser.url).to eq "http://watir.com/"
      browser.close
    end

    xit "opens Native App Locally" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: "Android",
              platformVersion: "8.1",
              deviceName: "Nexus",
              app: "https://github.com/address-book/mobile_apps/blob/master/AddressBook.apk?raw=true",
              appWaitActivity: "com.address.book.MainActivity",
      }
      app = TapWatir::App.new(opts)
      expect(app.driver).to be_a(Appium::Driver)
      app.quit
    end

    xit "opens Native App EmuSim"
    xit "opens Native App Real Device Cloud"
  end

  context "with iOS" do
    xit "opens Browser on Mobile Device"
    xit "opens Native App Locally"
    xit "opens Native App EmuSim"
    xit "opens Native App Real Device Cloud"
  end

end
