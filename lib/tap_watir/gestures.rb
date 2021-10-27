require 'appium_lib_core/common/touch_action/touch_actions'

module TapWatir
  module Gestures
    def action
      Appium::Core::TouchAction.new(@driver)
    end

    def tap
      action.tap(element: wd).perform
    end

    alias press tap

    def double_tap
      action.double_tap(element: wd).perform
    end

    def swipe_to(opts)
      start_x = coordinates.x
      start_y = coordinates.y
      if opts.fetch :end_element
        end_element = opts.fetch :end_element
        coordinates = end_element.coordinates
        end_x = coordinates.x
        end_y = coordinates.y
      else
        end_x = opts.fetch :end_x
        end_y = opts.fetch :end_y
      end
      action.swipe(start_x: start_x, start_y: start_y, end_x: end_x, end_y: end_y, duration: opts.fetch(:duration)).perform
    end
  end
end
