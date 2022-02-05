require 'appium_lib_core/common/touch_action/touch_actions'
require 'selenium/webdriver/common/interactions/interactions'

module TapWatir
  module Gestures

    VIEWPORT = ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT

    def action(kind, name)
      @driver.action.add_pointer_input(kind, name)
    end

    def perform(*actions)
      @driver.perform_actions actions
    end

    def tap
      finger_tap = action(:touch, 'finger_tap')
      finger_tap.create_pointer_move(duration: 0.1, x: bounds[:x], y: bounds[:y], origin: VIEWPORT)
      finger_tap.create_pointer_down(:left)
      finger_tap.create_pause(0.1)
      finger_tap.create_pointer_up(:left)
      perform finger_tap
    end

    alias press tap

    def double_tap
      2.times { tap }
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
      action.swipe(start_x: start_x,
                   start_y: start_y,
                   end_x: end_x,
                   end_y: end_y,
                   duration: opts.fetch(:duration)).perform
    end

    def two_finger_tap
      action.two_finger_tap(element: wd).perform
    end
  end
end
