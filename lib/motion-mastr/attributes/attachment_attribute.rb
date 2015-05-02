module MotionMastr
  module Attributes

    # NSAttachmentAttributeName
    #
    # :attachment = NSTextAttachment
    #
    #
    def attachment_attribute(styles={})
      return nil if styles.nil?
      styles[:attachment].is_a?(NSTextAttachment) ? styles[:attachment] : nil
    end

  end
end
