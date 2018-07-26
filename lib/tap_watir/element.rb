require 'watir'

module TapWatir
  class Element

    def initialize(driver,selector) #breaks PR #7
      @driver = driver
      @selector = selector
    end

    # should be private
    private
    def locate
      @element = @driver.find_element(@selector.keys.first,@selector.values.first)
    end

    def wd
      @element || locate
    end

    def exist?

      return false if @element
      assert_exists
    end


    def assert_exists? # should I be using rescue ??
      locate unless @element
      return if @element
      raise Watir::Exception::UnknownObjectException
    end

  end
end
