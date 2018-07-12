require 'appium_lib_core'




RSpec.describe TapWatir do
  context "with Android" do
    it "opens Browser on Mobile Device" do
      opts = {
              url: 'http://localhost:4723/wd/hub',
              platformName: 'Android',
              platformVersion: '9',
              deviceName: 'Nexus',
              browserName: 'Chrome'
      }

      browser = TapWatir::MobileBrowser.new(url:opts[:url],desired_capabilities:opts)
      browser.goto "http://watir.com/"
      expect(browser.url).to eq "http://watir.com/"
      browser.close
    end



    it "opens Native/Hybrid App Locally" do
      opts = {
              url: 'http://localhost:4723/wd/hub',
              platformName: "Android",
              platformVersion: "9",
              deviceName: "Nexus",
              app: "/Users/prakharrawat/Documents/eb.apk",
              automationName: "UIAutomator2"
      }
      app = TapWatir::MobileBrowser.new(url:opts[:url],desired_capabilities:opts)
      # app.wait 2
      app.quit
    end


      it "opens Native App EmuSim" do
        opts = {

            platformName: "Android",
            platformVersion: "7.1",
            deviceName: "Android GoogleAPI Emulator",
            app: "sauce-storage:eb.apk",
            buildName: "Hybrid application test using emu/sim",
            automationName: 'XCUITest',
            wait: '50',
            url: "http://prakhar.rawat:dd8fe191-94aa-4178-8bbe-26416c886112@ondemand.saucelabs.com:80/wd/hub",
            sauce_username: ENV['SAUCE_LABS'] ? ENV['SAUCE_USERNAME'] : nil,
            sauce_access_key: ENV['SAUCE_LABS'] ? ENV['SAUCE_ACCESS_KEY'] : nil
        }

        newUrl = opts.delete(:url)
        app = TapWatir::MobileBrowser.new(url:newUrl,desired_capabilities:opts)
        app.wait 2
        app.close
      end






    it "opens Native App Real Device Cloud" do


    end
  end

  context "with iOS" do``

   xit "opens Browser on Mobile Device" do
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

    it "opens Native App Locally" do
      opts = {
          url: 'http://localhost:4723/wd/hub',
          # platformVersion: "11.4",
          platformName: "iOS",
          # deviceName: "iPhone X",
          # udid: 'D30DF733-9D7E-47C7-BAC3-F947F2F1B82E',
          # automationName: "XCUITest",
          app: "/Users/prakharrawat/Documents/Address_Book.ipa"
          # app: "https://github.com/address-book/address_book_ios/blob/master/Address_Book.ipa"
      }
      newUrl = opts.delete(:url)
      app = TapWatir::MobileBrowser.new(url:newUrl,desired_capabilities:opts)
      app.wait 2
      # app.screenshot
      app.quit
    end
    it "opens Native App EmuSim" do
      opts = {
          platformName: "iOS",
          platformVersion: "11.0",
          deviceName: "iPhone X Simulator",
          app: "sauce-storage:log.ipa",
          buildName: "Native and Hybrid test on iOS Sauce",
          url: "http://prakhar.rawat:dd8fe191-94aa-4178-8bbe-26416c886112@ondemand.saucelabs.com:80/wd/hub",
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

    xit "opens Native App Real Device Cloud"
  end

end
