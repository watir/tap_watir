RSpec.describe TapWatir do
  context "with Android" do
    it "opens Browser on Mobile Device" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: 'Android',
              platformVersion: '9',
              deviceName: 'Nexus',
              browserName: 'Chrome'}

      browser = TapWatir::MobileBrowser.new(opts)
      # puts opts
      # puts browser
      # browser.goto "http://watir.com/"
      # expect(browser.url).to eq "http://watir.com/"
      # browser.close
    end

    it "opens Native App Locally" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: 'Android',
              platformVersion: '9',
              deviceName: 'Nexus',
              app: '/Users/prakharrawat/Documents/notes.apk'
              # appWaitActivity: 'com.address.book.MainActivity',
      }

      app = TapWatir::App.new(opts)
      expect(app.driver).to be_a(Appium::Driver)
      app.quit
    end

    xit "opens Native App EmuSim"
    xit "opens Native App Real Device Cloud"
  end

end
