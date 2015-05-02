module MotionMastr
  module Attributes

    # NSFontAttributeName
    #
    # :font = UIFont
    #
    def font_attribute(styles={})
      return nil if styles.nil?
      value = styles[:font]
      return nil unless value && value.is_a?(UIFont)
      value
    end

  end
end
