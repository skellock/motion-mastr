module MotionMastr
  module Attributes

    # NSStrikethroughStyleAttribute
    #
    # :strikethrough_style is either a Symbol or Array of symbols which will be OR'd together
    #
    def strikethrough_style_attribute(styles={})
      return nil if styles.nil?
      value = styles[:strikethrough_style]
      return underline_style_value(value) if value.is_a? Symbol
      if value.is_a? Array
        bitsauce = 0
        value.each { |s| bitsauce |= underline_style_value(s) }
        bitsauce
      else
        nil
      end
    end

  end
end
