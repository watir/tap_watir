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
  end
end
