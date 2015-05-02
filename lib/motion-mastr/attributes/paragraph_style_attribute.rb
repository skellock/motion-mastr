module MotionMastr
  module Attributes

    # NSParagraphStyleAttributeName
    #
    # :alignment
    #    :left, :right, :center, :centered
    #
    # :first_line_head_indent
    #    non-negative Float
    #
    # :head_indent
    #    non-negative Float
    #
    # :tail_indent
    #    non-negative Float
    #
    # :line_break_mode
    #
    #   :by_word, :by_word_wrap, :by_word_wrapping, :word, :word_wrapping, :word_wrap
    #   :by_char, :by_char_wrapping, :char
    #   :clip, :clipping, :by_clipping
    #   :by_truncating_head, :head
    #   :by_truncating_tail, :tail
    #   :by_truncating_middle, :middle
    #
    # :maximum_line_height
    #
    #    0, :off, :infinite, :none
    #    or a Float
    #
    # :minimum_line_height
    #
    #    0, :off, :infinite, :none
    #    or a Float
    #
    # :line_spacing
    #
    #    0 or a positive Float
    #
    # :paragraph_spacing
    #
    #    0 or a positive Float
    #
    # :paragraph_spacing_before
    #
    #    0, :default
    #    or a positive Float
    #
    # :base_writing_direction
    #
    #    :natural, :default
    #    :left, :left_to_right, :l2r
    #    :right, :right_to_left, :r2l
    #
    # :line_height_multiple
    #
    #    0, :default
    #    or a positive Float
    #
    # :default_tab_interval
    #
    #   0, :default
    #   or a positive Float
    #
    # :hyphenation_factor
    #   0, :deffault
    #   or a positive Float up to 1.0
    #
    def paragraph_style_attribute(styles={})
      return nil if styles.nil?

      # search for valid paragraph-related keys
      style_keys                 = styles.keys
      paragraph_related_keys     = [
        :alignment,
        :first_line_head_indent,
        :head_indent,
        :tail_indent,
        :line_break_mode,
        :maximum_line_height,
        :minimum_line_height,
        :line_spacing,
        :paragraph_spacing,
        :paragraph_spacing_before,
        :base_writing_direction,
        :line_height_multiple,
        :default_tab_interval,
        :hyphenation_factor,
      ]
      contains_paragraph_styling = (style_keys - paragraph_related_keys).length != style_keys.length
      return nil unless contains_paragraph_styling

      # start with logical defaults
      paragraph = NSParagraphStyle.defaultParagraphStyle.mutableCopy

      # alignment
      if styles[:alignment]
        case styles[:alignment]
        when :right then paragraph.alignment = NSTextAlignmentRight
        when :center, :centered, :centre, :centred then paragraph.alignment = NSTextAlignmentCenter
        when :left then paragraph.alignment = NSTextAlignmentLeft
        end
      end

      # first line head indent
      if styles[:first_line_head_indent]
        indent = styles[:first_line_head_indent].to_f
        indent = 0 if indent < 0
        paragraph.firstLineHeadIndent = indent
      end

      # head indent
      if styles[:head_indent]
        indent = styles[:head_indent].to_f
        indent = 0 if indent < 0
        paragraph.headIndent = indent
      end

      # tail indent
      if styles[:tail_indent]
        indent = styles[:tail_indent].to_f
        indent = 0 if indent < 0
        paragraph.tailIndent = indent
      end

      # line break mode
      if styles[:line_break_mode]
        case styles[:line_break_mode]
        when :by_word, :by_word_wrap, :by_word_wrapping, :word, :word_wrapping, :word_wrap then paragraph.lineBreakMode = NSLineBreakByWordWrapping
        when :by_char, :by_char_wrapping, :char then paragraph.lineBreakMode = NSLineBreakByCharWrapping
        when :clip, :clipping, :by_clipping then paragraph.lineBreakMode = NSLineBreakByClipping
        when :by_truncating_head, :head then paragraph.lineBreakMode = NSLineBreakByTruncatingHead
        when :by_truncating_tail, :tail then paragraph.lineBreakMode = NSLineBreakByTruncatingTail
        when :by_truncating_middle, :middle then paragraph.lineBreakMode = NSLineBreakByTruncatingMiddle
        end
      end

      # maximum line height
      if styles[:maximum_line_height]
        maximum_line_height = styles[:maximum_line_height]
        maximum_line_height = 0 if [:off, :infinite, 0, :none].include?(maximum_line_height)
        maximum_line_height ||= maximum_line_height.to_f
        maximum_line_height = 0 if maximum_line_height < 0
        paragraph.maximumLineHeight = maximum_line_height
      end

      # minimum line height
      if styles[:minimum_line_height]
        minimum_line_height = styles[:minimum_line_height]
        minimum_line_height = 0 if [:off, :infinite, 0, :none].include?(minimum_line_height)
        minimum_line_height ||= minimum_line_height.to_f
        minimum_line_height = 0 if minimum_line_height < 0
        paragraph.minimumLineHeight = minimum_line_height
      end

      # line spacing
      if styles[:line_spacing]
        line_spacing = styles[:line_spacing].to_f
        line_spacing = 0 if line_spacing < 0
        paragraph.lineSpacing = line_spacing
      end

      # paragraph spacing
      if styles[:paragraph_spacing]
        paragraph_spacing = styles[:paragraph_spacing].to_f
        paragraph_spacing = 0 if paragraph_spacing < 0
        paragraph.paragraphSpacing = paragraph_spacing
      end

      # paragraph spacing before
      if styles[:paragraph_spacing_before]
        paragraph_spacing_before = styles[:paragraph_spacing_before]
        paragraph_spacing_before = 0 if [0, :default].include?(paragraph_spacing_before)
        paragraph_spacing_before ||= styles[:paragraph_spacing_before].to_f
        paragraph_spacing_before = 0 if paragraph_spacing_before < 0
        paragraph.paragraphSpacingBefore = paragraph_spacing_before
      end

      # base writing direction
      if styles[:base_writing_direction]
        case styles[:base_writing_direction]
        when :natural, :default then paragraph.baseWritingDirection = NSWritingDirectionNatural
        when :left, :left_to_right, :l2r then paragraph.baseWritingDirection = NSWritingDirectionLeftToRight
        when :right, :right_to_left, :r2l then paragraph.baseWritingDirection = NSWritingDirectionRightToLeft
        end
      end

      # line height multiple
      if styles[:line_height_multiple]
        line_height_multiple = styles[:line_height_multiple]
        line_height_multiple = 0 if [0, :default].include?(line_height_multiple)
        line_height_multiple ||= styles[:line_height_multiple].to_f
        line_height_multiple = 0 if line_height_multiple < 0
        paragraph.lineHeightMultiple = line_height_multiple
      end

      # default tab interval
      if styles[:default_tab_interval]
        default_tab_interval = styles[:default_tab_interval]
        default_tab_interval = 0 if [0, :default].include?(default_tab_interval)
        default_tab_interval ||= styles[:default_tab_interval].to_f
        default_tab_interval = 0 if default_tab_interval < 0
        paragraph.defaultTabInterval = default_tab_interval
      end

      # hyphenation factor
      if styles[:hyphenation_factor]
        hyphenation_factor = styles[:hyphenation_factor]
        hyphenation_factor = 0 if [0, :default].include?(hyphenation_factor)
        hyphenation_factor ||= styles[:hyphenation_factor].to_f
        hyphenation_factor = 0 if hyphenation_factor < 0
        hyphenation_factor = 1.0 if hyphenation_factor > 1
        paragraph.hyphenationFactor = hyphenation_factor
      end

      paragraph
    end

  end
end
