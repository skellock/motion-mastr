module MotionMastr
  class Builder

    include Attributes

    attr_reader :default_styles, :pieces

    ATTRIBUTES = {
      font_attribute:                NSFontAttributeName,
      foreground_color_attribute:    NSForegroundColorAttributeName,
      background_color_attribute:    NSBackgroundColorAttributeName,
      stroke_color_attribute:        NSStrokeColorAttributeName,
      strikethrough_color_attribute: NSStrikethroughColorAttributeName,
      underline_color_attribute:     NSUnderlineColorAttributeName,
      ligature_attribute:            NSLigatureAttributeName,
      kern_attribute:                NSKernAttributeName,
      paragraph_style_attribute:     NSParagraphStyleAttributeName,
      strikethrough_style_attribute: NSStrikethroughStyleAttributeName,
      underline_style_attribute:     NSUnderlineStyleAttributeName,
      stroke_width_attribute:        NSStrokeWidthAttributeName,
      shadow_attribute:              NSShadowAttributeName,
      text_effect_attribute:         NSTextEffectAttributeName,
      attachment_attribute:          NSAttachmentAttributeName,
    }

    def initialize(default_styles={})
      @default_styles = default_styles || {}
      @pieces = []
    end

    # write to default styles
    def []=(key, value)
      @default_styles[key] = value
    end

    # read from default styles
    def [](key)
      @default_styles[key]
    end

    # add a piece of text and optional styles
    def add(text, styles={})
      @pieces << {text: text, styles: styles} unless text.nil?
      self
    end

    def build
      # weld up the text pieces
      text = @pieces.map { |p| p[:text] }.join

      # compose a attribute string
      result = NSMutableAttributedString.alloc.initWithString(text)

      # style it with the default styles
      apply_attributes result, 0, text.length, @default_styles

      # apply the styles from the pieces
      idx = 0
      @pieces.each do |piece|
        apply_attributes result, idx, piece[:text].length, piece[:styles]
        idx += piece[:text].length
      end

      result
    end

    # applies styles in a range to the attributed string
    def apply_attributes(attributed_string, start, length, styles)
      return unless attributed_string && start && length && styles # sanity
      return unless start >= 0 && length > 0 && styles.length > 0  # minimums
      return unless start + length <= attributed_string.length     # maximums

      range = [start, length]

      ATTRIBUTES.each_pair do |method_name, attribute_name|
        value = send method_name, styles
        attributed_string.addAttribute(attribute_name, value: value, range: range) if value
      end
    end

  end
end
