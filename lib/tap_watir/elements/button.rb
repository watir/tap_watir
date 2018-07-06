module Tap_watir
  class Button < HTMLElement
    inherit_attributes_from Watir::Input
    VALID_TYPES = %w[button reset submit image]
    #Text of the button
    #for input elements, return the value of the button
    # for button elements, return the text of the button

    def text
      tn  = tag_name
      case tn
      when 'input'
        value
      when 'button'
        super
      else
        raise Exception::Error, "tag name for the button is unknown: #{tn}"
      end
    end
  end #Button
end #Tap_Watir