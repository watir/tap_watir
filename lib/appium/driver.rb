module Appium
  module Core
    class Driver

      alias_method :appium_set_app_path, :set_app_path

      def set_app_path
        appium_set_app_path unless @caps[:app] =~ URI.regexp
      end

    end
  end
end
