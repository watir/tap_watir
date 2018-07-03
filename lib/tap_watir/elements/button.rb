module Tapwatir
  class Button < HTMLElement
    inherit_attributes_from Watir::Input
    VALID_TYPES = %w[button reset submit image]
    #Text of the button
    #
  end
end