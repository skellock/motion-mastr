module MotionMastr
  module Attributes

    # NSShadowAttributeName
    #
    # :shadow_offset
    #    CGSize
    #
    def shadow_attribute(styles={})
      return nil if styles.nil?

      # search for valid shadow-related keys
      style_keys = styles.keys
      shadow_keys = [:shadow_offset, :shadow_blur_radius, :shadow_color]
      contains_shadow_styling = (style_keys - shadow_keys).length != style_keys.length
      return nil unless contains_shadow_styling

      # create our shadow
      shadow = NSShadow.alloc.init

      # offset
      if styles[:shadow_offset]
        offset = styles[:shadow_offset]
        if offset.is_a? CGSize
          shadow.shadowOffset = offset
        elsif offset.is_a? Array
          shadow.shadowOffset = offset if offset.length == 2
        elsif offset.is_a? Fixnum
          shadow.shadowOffset = [offset, offset]
        elsif offset.is_a? Float
          shadow.shadowOffset = [offset, offset]
        end
      end

      # blur
      if styles[:shadow_blur_radius]
        blur = styles[:shadow_blur_radius]
        blur = 0 if [0, :default, :none, :off].include?(blur)
        blur ||= blur.to_f
        blur = 0 if blur < 0
        shadow.shadowBlurRadius = blur
      end

      # color
      shadow.shadowColor = styles[:shadow_color] if styles[:shadow_color].is_a? UIColor

      shadow
    end

  end
end
