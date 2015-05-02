module MotionMastr
  module Attributes

    # NSExpansionAttributeName
    #
    # :expansion
    #   * 0, :default
    #   * A Float
    #
    def expansion_attribute(styles={})
      return nil if styles.nil?
      return nil if styles[:expansion].nil?
      value = styles[:expansion]
      return 0 if [0, :default].include?(value)
      return nil unless value.respond_to?(:to_f)
      return value.to_f
    end

  end
end
