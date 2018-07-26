require 'watir'

module TapWatir
  class Element

    def initialize(driver,selector)
      @driver = driver
      @selector = selector
    end
    private
    def locate
      @element = @driver.find_element(@selector.keys.first,@selector.values.first)
    end

    def wd
      @element || locate
    end
  end
end
