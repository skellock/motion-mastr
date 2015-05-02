module MotionMastr
  module Attributes

    # NSKernAttributeName
    #
    # :kern or :kerning
    #   * 0, :off, :none, :default
    #   * A Float
    #
    def kern_attribute(styles={})
      return nil if styles.nil?
      return unless styles[:kern] || styles[:kerning]
      value = styles[:kern] || styles[:kerning]
      return 0 if [0, :off, :none, :default].include?(value)
      return value.to_f
    end

  end
end
