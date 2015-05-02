module MotionMastr
  module Attributes

    # NSBaselineOffsetAttributeName
    #
    # :baseline_offset
    #   * 0, :default
    #   * A Float
    #
    def baseline_offset_attribute(styles={})
      return nil if styles.nil?
      return nil if styles[:baseline_offset].nil?
      value = styles[:baseline_offset]
      return 0 if [0, :default].include?(value)
      return nil unless value.respond_to?(:to_f)
      return value.to_f
    end

  end
end
