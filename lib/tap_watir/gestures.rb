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
      tap = action(:touch, 'tap')
      tap.create_pointer_move(duration: 0.1, x: bounds[:x], y: bounds[:y], origin: VIEWPORT)
      tap.create_pointer_down(:left)
      tap.create_pointer_up(:left)
      perform tap
    end

    alias press tap

    def double_tap
      double_tap = action(:touch, 'double_tap')
      double_tap.create_pointer_move(duration: 0.1, x: bounds[:x], y: bounds[:y], origin: VIEWPORT)
      double_tap.create_pointer_down(:left)
      double_tap.create_pointer_up(:left)
      double_tap.create_pause(0.5)
      double_tap.create_pointer_down(:left)
      double_tap.create_pointer_up(:left)

      perform double_tap
    end

    def two_finger_tap
      first_finger = action(:touch, 'first_finger')
      first_finger.create_pointer_move(duration: 1, x: bounds[:x], y: bounds[:y], origin: VIEWPORT)
      first_finger.create_pause(0.5)
      first_finger.create_pointer_down(:left)
      first_finger.create_pause(0.5)
      first_finger.create_pointer_up(:left)

      second_finger = action(:touch, 'second_finger')
      second_finger.create_pointer_move(duration: 1, x: bounds[:x], y: bounds[:y], origin: VIEWPORT)
      first_finger.create_pause(0.5)
      second_finger.create_pointer_down(:left)
      second_finger.create_pause(0.5)
      second_finger.create_pointer_up(:left)

      perform first_finger, second_finger
    end

    def swipe_to(opts)
      if opts.fetch :start_element
        start_x = coordinates.x
        start_y = coordinates.y
      elsif opts.fetch :end_element
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
  end
end
