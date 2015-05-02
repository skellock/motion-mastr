module MotionMastr
  module Attributes

    # NSBackgroundColorAttributeName
    #
    # :background_color = UIColor
    #
    def background_color_attribute(styles={})
      return nil if styles.nil?
      value = styles[:background_color]
      return nil unless value && value.is_a?(UIColor)
      value
    end

  end
end
