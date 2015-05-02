module MotionMastr
  module Attributes

    # NSForegroundColorAttributeName
    #
    # :foreground_color = UIColor
    #
    def foreground_color_attribute(styles={})
      return nil if styles.nil?
      value = styles[:foreground_color]
      return nil unless value && value.is_a?(UIColor)
      value
    end

  end
end
