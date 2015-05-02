module MotionMastr
  module Attributes

    # NSStrokeColorAttributeName
    #
    # :stroke_color = UIColor
    #
    def stroke_color_attribute(styles={})
      return nil if styles.nil?
      value = styles[:stroke_color]
      return nil unless value && value.is_a?(UIColor)
      value
    end

  end
end
