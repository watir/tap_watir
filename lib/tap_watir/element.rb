module TapWatir
  class Element

    def initialize(driver,selector) #breaks PR #7
      @driver = driver
      @selector = selector
    end

    # should be made private to limit access to assert_exist?
    def locate
      @element = @driver.find_element(@selector.keys.first,@selector.values.first)
    end

    def wd
      @element || locate
    end

  end
end
