require "watir"
require 'appium_lib_core'

module TapWatir
  class App


    # How currently it was sending the options




    # What ruby_lib_core expects
    #     opts = {
    #              caps: {
    #                platformName: :ios,
    #                platformVersion: '11.0',
    #                deviceName: 'iPhone Simulator',
    #                automationName: 'XCUITest',
    #                app: '/path/to/MyiOS.app'
    #              },
    #              appium_lib: {
    #                server_url: "http://custom-host:8080/wd/hub.com",
    #                export_session: false,
    #                port: 8080,
    #                wait: 0,
    #                wait_timeout: 20,
    #                wait_interval: 0.3,
    #                listener: nil,
    #              }
    #            }

    def initialize(opts)
      # What is `target` here?
      # Is this even the right class to initialize?
      @driver = Appium::Core::Driver.for(self, opts).start_driver
    end

  end

  class MobileBrowser < Watir::Browser
    def initialize(opts)
      # puts "\n\n\n\n\n\n"
      # puts opts.to_s
      # puts "\n\n\n\n\n"
      @browser = super Selenium::WebDriver.for(:remote, opts)
    end
  end
end