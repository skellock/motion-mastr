module MotionMastr
  module Attributes

    # NSLigatureAttributeName
    #
    # :ligature
    #   = 0, :off, :none
    #   = 1, :on, :default
    #
    def ligature_attribute(styles={})
      return nil if styles.nil?
      value = styles[:ligature]
      return 0 if [0, :off, :none].include?(value)
      return 1 if [1, :on, :default].include?(value)
      nil
    end

  end
end
