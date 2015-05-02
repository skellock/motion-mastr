module MotionMastr
  module Attributes

    # NSStrokeWidthAttributeName
    #
    # :stroke_width
    #   * 0, :default
    #   * A Float
    #
    def stroke_width_attribute(styles={})
      return nil if styles.nil?
      return nil if styles[:stroke_width].nil?
      value = styles[:stroke_width]
      return 0 if [0, :default].include?(value)
      return nil unless value.respond_to?(:to_f)
      return value.to_f
    end

  end
end
