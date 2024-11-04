# frozen_string_literal: true

require_relative 'wait'

module TapWatir

  #
  # This is a element in the native app context
  #
  class Element
    include Waitable

    def initialize(driver, selector)
      @driver = driver
      @selector = selector
    end

    def wd
      @element || locate
    end

    def exists?
      assert_exists
      true
    rescue Watir::Exception::UnknownObjectException
      false
    end
    alias exist? exists?

    def present?
      assert_exists
      @element.displayed?
    rescue Watir::Exception::UnknownObjectException
      false
    end
    alias visible? present?

    def enabled?
      assert_exists
      @element.enabled?
    rescue Watir::Exception::UnknownObjectException
      false
    end

    private

    def locate
      @element = @driver.find_element(@selector.keys.first, @selector.values.first)
    rescue Selenium::WebDriver::Error::NoSuchElementError
      nil
    end

    def assert_exists
      locate unless @element
      return if @element

      raise Watir::Exception::UnknownObjectException
    end
  end
end