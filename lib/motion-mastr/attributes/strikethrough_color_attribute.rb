module MotionMastr
  module Attributes

    # NSStrikethroughColorAttributeName
    #
    # :strikethrough_color = UIColor
    #
    def strikethrough_color_attribute(styles={})
      return nil if styles.nil?
      value = styles[:strikethrough_color]
      return nil unless value && value.is_a?(UIColor)
      value
    end

  end
end
