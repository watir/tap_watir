# frozen_string_literal: true

module Appium
  module Core
    #
    # The Appium Driver is defined here to allow a monkey patch
    # This can be removed with future Appium release
    #
    class Driver
      alias appium_set_app_path set_app_path

      def set_app_path
        appium_set_app_path unless @caps[:app] =~ URI::DEFAULT_PARSER.make_regexp
      end
    end
  end
end
