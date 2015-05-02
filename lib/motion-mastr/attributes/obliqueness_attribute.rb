module MotionMastr
  module Attributes

    # NSObliquenessAttributeName
    #
    # :obliqueness
    #   * 0, :default
    #   * A Float
    #
    def obliqueness_attribute(styles={})
      return nil if styles.nil?
      return nil if styles[:obliqueness].nil?
      value = styles[:obliqueness]
      return 0 if [0, :default].include?(value)
      return nil unless value.respond_to?(:to_f)
      return value.to_f
    end

  end
end
