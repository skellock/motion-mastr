module MotionMastr
  module Attributes

    # NSUnderlineColorAttributeName
    #
    # :underline_color = UIColor
    #
    def underline_color_attribute(styles={})
      return nil if styles.nil?
      value = styles[:underline_color]
      return nil unless value && value.is_a?(UIColor)
      value
    end

  end
end
