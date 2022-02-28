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
      first_finger = action(:touch, 'finger1')
      first_finger.create_pointer_move(duration: 1, x: bounds[:x] - 100, y: bounds[:y] - 50, origin: VIEWPORT)
      first_finger.create_pointer_down(:left)
      first_finger.create_pause(0.0925)
      first_finger.create_pointer_up(:left)
      first_finger.create_pause(0.0925)

      second_finger = action(:touch, 'finger2')
      second_finger.create_pointer_move(duration: 1, x: 500, y: 1000, origin: VIEWPORT)
      second_finger.create_pointer_down(:left)
      second_finger.create_pause(0.0925)
      second_finger.create_pause(0.0925)
      second_finger.create_pointer_up(:left)

      perform first_finger, second_finger
    end

    def swipe(**args)
      finger = action(:touch, 'swipe')
      finger.create_pointer_move(duration: 1, x: 0, y: 0, origin: VIEWPORT)
      finger.create_pointer_down(:left)
      finger.create_pointer_move(duration: 1, x: 500, y: 1000, origin: VIEWPORT)
      finger.create_pointer_up(:left)

      perform finger
    end
  end
end
