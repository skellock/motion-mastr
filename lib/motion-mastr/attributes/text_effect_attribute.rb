module MotionMastr
  module Attributes

    # NSTextEffectAttributeName
    #
    # :text_effect = :symbol
    #
    def text_effect_attribute(styles={})
      return nil if styles.nil?
      return NSTextEffectLetterpressStyle if [:letterpress, :letterpress_style].include?(styles[:text_effect])
      nil
    end

  end
end
