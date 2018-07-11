RSpec.describe TapWatir do
  context "with Android" do
    it "opens Browser on Mobile Device" do
      opts = {
              url: 'http://localhost:4723/wd/hub',
              platformName: 'Android',
              platformVersion: '9',
              deviceName: 'Nexus',
              browserName: 'Chrome'}

      browser = TapWatir::MobileBrowser.new(url:opts[:url],desired_capabilities:opts)
      browser.goto "http://watir.com/"
      expect(browser.url).to eq "http://watir.com/"
      browser.close
    end



    it "opens Native/Hybrid App Locally" do
      opts = {url: 'http://localhost:4723/wd/hub',
              platformName: "Android",
              platformVersion: "9",
              deviceName: "Nexus",
              app: "/Path/To/Your/apk",
              automationName: 'UIAutomator2'
      }
      app = TapWatir::MobileBrowser.new(url:opts[:url],desired_capabilities:opts)
      app.quit
    end

    it "opens Native App EmuSim" do
      opts = {
          url: "http://ondemand.saucelabs.com:443/wd/hub",
          platformName: "Android",
          platformVersion: "7.1",
          deviceName: "Android GoogleAPI Emulator",
          app: "sauce-storage:eb.apk",
          sauce_username: "prakhar.rawat"

      }

      app = TapWatir::MobileBrowser.new(url:opts[:url],desired_capabilities:opts)
      app.wait 2
      app.quit
    end
    xit "opens Native App Real Device Cloud"
  end

  context "with iOS" do
    it 'should fire up a browser on iPhone' do
      opts = {
          url: 'http://localhost:4723/wd/hub',
          platformVersion: "11.4",
          deviceName: "iPhone X",
          platformName: "iOS",
          browserName: "Safari"
      }

      app = TapWatir::MobileBrowser.new(url:opts[:url],desired_capabilities:opts)
      app.goto "a.testaddressbook.com"
      expect(app.title).to eq ("Address Book")
      # app.wait('20')
      app.close

    end
    xit "opens Browser on Mobile Device"
    xit "opens Native App Locally"
    xit "opens Native App EmuSim"
    xit "opens Native App Real Device Cloud"
  end

end
