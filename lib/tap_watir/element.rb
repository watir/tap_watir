# frozen_string_literal: true

module TapWatir
  #
  # This is a element in the native app context
  #
  class Element
    def initialize(driver, selector)
      @driver = driver
      @selector = selector
    end

    def wd
      @element || locate
    end

    private

    def locate
      @element = @driver.find_element(@selector.keys.first, @selector.values.first)
    end
  end
end
