require 'watir'
module TapWatir
  class Element
    def initialize(driver,selector)
      @driver = driver
      @selector = selector
    end
    def locate
      @element = @driver.find_element(@selector.keys.first,@selector.values.first)
    end
    def exists?
      return false if @element
      assert_exists
      true
    rescue Watir::Exception::UnknownObjectException

      false
    end
    def assert_exists
      locate unless @element
      return if @element
    rescue Watir::Exception::UnknownObjectException
    end
    def wd
      @element || locate
    end
    def present?
        visible?
    rescue Watir::Exception::UnknownObjectException
      false
    end

    def visible?
      assert_exists
      @element.displayed?
    rescue Watir::Exception::UnknownObjectException

    end
    private :locate, :assert_exists
  end
end