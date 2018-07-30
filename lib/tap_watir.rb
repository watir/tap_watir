# frozen_string_literal: true

require 'watir'
require 'appium_lib_core'
require 'appium/driver'
require 'tap_watir/element'

module TapWatir
  #
  # For driving a native application or or a native app context
  #
  class App
    attr_accessor :driver

    def initialize(opts)
      url = opts[:caps].delete(:url)
      @driver = Appium::Core.for(self, opts).start_driver(server_url: url)
    end

    def quit
      @driver.quit
    end
    alias close quit

    def element
      Element.new
    end

    def method_missing(method_name, *arguments, &block)
      if driver.respond_to? method_name
        driver.send method_name, *arguments, &block
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      driver.respond_to?(method_name) || super
    end
  end

  #
  # For driving a mobile browser or a webview context
  #
  class MobileBrowser < Watir::Browser
    def initialize(opts)
      @browser = super Selenium::WebDriver.for(:remote, opts)
    end
  end
end
