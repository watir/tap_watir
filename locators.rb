require 'tap_watir/locators/button/locator'
require 'tap_watir/locators/button/selector_builder'
require 'tap_watir/locators/button/selector_builder/xpath'
require 'tap_watir/locators/button/validator'


module Tap_watir
  module Locators
    module ClassHelpers
      def locator_class
        class_from_string("#{Watir.locator_namespace}::#{element_class_name}::Locator") ||
            class_from_string("Watir::Locators::#{element_class_name}::Locator") ||
            class_from_string("#{Watir.locator_namespace}::Element::Locator") ||
            Watir::Locators::Element::Locator
      end

      def element_validator_class
        class_from_string("#{Watir.locator_namespace}::#{element_class_name}::Validator") ||
            class_from_string("Watir::Locators::#{element_class_name}::Validator") ||
            class_from_string("#{Watir.locator_namespace}::Element::Validator") ||
            Watir::Locators::Element::Validator
      end

      def selector_builder_class
        class_from_string("#{Watir.locator_namespace}::#{element_class_name}::SelectorBuilder") ||
            class_from_string("Watir::Locators::#{element_class_name}::SelectorBuilder") ||
            class_from_string("#{Watir.locator_namespace}::Element::SelectorBuilder") ||
            Watir::Locators::Element::SelectorBuilder
      end

      def class_from_string(string)
        Kernel.const_get(string)
      rescue NameError
        nil
      end

      def element_class_name
        element_class.to_s.split('::').last
      end

      def build_locator
        @query_scope.send :ensure_context

        element_validator = element_validator_class.new
        selector_builder = selector_builder_class.new(@query_scope, @selector.dup, element_class.attribute_list)
        locator_class.new(@query_scope, @selector.dup, selector_builder, element_validator)
      end
    end
  end

end