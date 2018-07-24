require "watir"
require 'appium_lib_core'
require 'appium/driver'

module TapWatir
  class App

    attr_accessor :driver

    def initialize(opts)
      url = opts[:caps].delete(:url)
      @driver = Appium::Core.for(self, opts).start_driver(server_url: url)
    end

    def quit
      @driver.quit
    end
    alias_method :close, :quit

    def method_missing(method_name, *arguments, &block)
      if driver.respond_to? method_name
        driver.send method_name, *arguments, &block
      else
        super
      end
    end

    def respond_to?(method_name, include_private = false)
      driver.respond_to?(method_name) || super
    end
  end

  class MobileBrowser < Watir::Browser
    def initialize(opts)
      @browser = super Selenium::WebDriver.for(:remote, opts)
    end
  end
end
