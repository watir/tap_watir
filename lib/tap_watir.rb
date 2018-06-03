require "watir"

module TapWatir
  class App
    def self.browser(opts)
      MobileBrowser.new opts
    end
  end

  class MobileBrowser < Watir::Browser
    def initialize(opts)
      super Selenium::WebDriver.for(:remote, opts)
    end
  end
end
