module MotionMastr
  module Attributes

    # NSLinkAttributeName
    #
    # :link = NSString or NSURL
    #
    #
    def link_attribute(styles={})
      return nil if styles.nil?
      return styles[:link] if styles[:link].is_a?(NSURL) || styles[:link].is_a?(String)
      nil
    end

  end
end
