describe "Paragraph Style Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given no styles" do
    @builder.paragraph_style_attribute(nil).should == nil
  end

  it "should return nil if no paragraph styles are given" do
    @builder.paragraph_style_attribute({}).should == nil
  end

  describe "Alignment" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(alignment: :left).class.should == NSMutableParagraphStyle
    end

    it "should support left" do
      @builder.paragraph_style_attribute(alignment: :left).alignment.should == NSTextAlignmentLeft
    end

    it "should support right" do
      @builder.paragraph_style_attribute(alignment: :right).alignment.should == NSTextAlignmentRight
    end

    it "should support center" do
      @builder.paragraph_style_attribute(alignment: :center).alignment.should == NSTextAlignmentCenter
      @builder.paragraph_style_attribute(alignment: :centered).alignment.should == NSTextAlignmentCenter
      @builder.paragraph_style_attribute(alignment: :centre).alignment.should == NSTextAlignmentCenter
      @builder.paragraph_style_attribute(alignment: :centred).alignment.should == NSTextAlignmentCenter
    end

    it "should use defaults when given unsupported things" do
      default = NSParagraphStyle.defaultParagraphStyle.mutableCopy
      @builder.paragraph_style_attribute(alignment: :foo).alignment.should == default.alignment
      @builder.paragraph_style_attribute(alignment: nil).alignment.should == default.alignment
      @builder.paragraph_style_attribute(alignment: "leftwards").alignment.should == default.alignment
    end

  end

  describe "First Line Head Indent" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(first_line_head_indent: 0).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(first_line_head_indent: -3).firstLineHeadIndent.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(first_line_head_indent: 4.0).firstLineHeadIndent.should == 4.0
    end

  end

  describe "Head Indent" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(head_indent: 0).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(head_indent: -3).headIndent.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(head_indent: 4.0).headIndent.should == 4.0
    end

  end

  describe "Tail Indent" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(tail_indent: 0).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(tail_indent: -3).tailIndent.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(tail_indent: 4.0).tailIndent.should == 4.0
    end
  end


  describe "Line Break Mode" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(line_break_mode: :head).class.should == NSMutableParagraphStyle
    end

    it "should be set by word" do
      @builder.paragraph_style_attribute(line_break_mode: :by_word).lineBreakMode.should == NSLineBreakByWordWrapping
      @builder.paragraph_style_attribute(line_break_mode: :by_word_wrap).lineBreakMode.should == NSLineBreakByWordWrapping
      @builder.paragraph_style_attribute(line_break_mode: :by_word_wrapping).lineBreakMode.should == NSLineBreakByWordWrapping
      @builder.paragraph_style_attribute(line_break_mode: :word).lineBreakMode.should == NSLineBreakByWordWrapping
      @builder.paragraph_style_attribute(line_break_mode: :word_wrapping).lineBreakMode.should == NSLineBreakByWordWrapping
      @builder.paragraph_style_attribute(line_break_mode: :word_wrap).lineBreakMode.should == NSLineBreakByWordWrapping
    end

    it "should be set by char" do
      @builder.paragraph_style_attribute(line_break_mode: :by_char).lineBreakMode.should == NSLineBreakByCharWrapping
      @builder.paragraph_style_attribute(line_break_mode: :by_char_wrapping).lineBreakMode.should == NSLineBreakByCharWrapping
      @builder.paragraph_style_attribute(line_break_mode: :char).lineBreakMode.should == NSLineBreakByCharWrapping
    end

    it "should be set by clipping" do
      @builder.paragraph_style_attribute(line_break_mode: :clip).lineBreakMode.should == NSLineBreakByClipping
      @builder.paragraph_style_attribute(line_break_mode: :clipping).lineBreakMode.should == NSLineBreakByClipping
      @builder.paragraph_style_attribute(line_break_mode: :by_clipping).lineBreakMode.should == NSLineBreakByClipping
    end

    it "should be set by head" do
      @builder.paragraph_style_attribute(line_break_mode: :by_truncating_head).lineBreakMode.should == NSLineBreakByTruncatingHead
      @builder.paragraph_style_attribute(line_break_mode: :head).lineBreakMode.should == NSLineBreakByTruncatingHead
    end

    it "should be set by tail" do
      @builder.paragraph_style_attribute(line_break_mode: :by_truncating_tail).lineBreakMode.should == NSLineBreakByTruncatingTail
      @builder.paragraph_style_attribute(line_break_mode: :tail).lineBreakMode.should == NSLineBreakByTruncatingTail
    end

    it "should be set by middle" do
      @builder.paragraph_style_attribute(line_break_mode: :by_truncating_middle).lineBreakMode.should == NSLineBreakByTruncatingMiddle
      @builder.paragraph_style_attribute(line_break_mode: :middle).lineBreakMode.should == NSLineBreakByTruncatingMiddle
    end

  end

  describe "Maximum Line Height" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(maximum_line_height: 0).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(maximum_line_height: -3).maximumLineHeight.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(maximum_line_height: 4.0).maximumLineHeight.should == 4.0
    end

    it "should allow various shades of nothingness" do
      @builder.paragraph_style_attribute(maximum_line_height: 0).maximumLineHeight.should == 0
      @builder.paragraph_style_attribute(maximum_line_height: :off).maximumLineHeight.should == 0
      @builder.paragraph_style_attribute(maximum_line_height: :none).maximumLineHeight.should == 0
      @builder.paragraph_style_attribute(maximum_line_height: :infinite).maximumLineHeight.should == 0
    end
  end


  describe "With Line Spacing" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(line_spacing: 1).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(line_spacing: -2).lineSpacing.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(line_spacing: 4.0).lineSpacing.should == 4.0
    end

  end

  describe "With Paragraph Spacing" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(paragraph_spacing: 1).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(paragraph_spacing: -2).paragraphSpacing.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(paragraph_spacing: 4.0).paragraphSpacing.should == 4.0
    end

  end

  describe "With Paragraph Spacing Before" do
    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(paragraph_spacing_before: 1).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(paragraph_spacing_before: -2).paragraphSpacingBefore.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(paragraph_spacing_before: 4.0).paragraphSpacingBefore.should == 4.0
    end

    it "should allow various shades of nothingness" do
      @builder.paragraph_style_attribute(paragraph_spacing_before: 0).paragraphSpacingBefore.should == 0
      @builder.paragraph_style_attribute(paragraph_spacing_before: :default).paragraphSpacingBefore.should == 0
    end
  end

  describe "With Base Writing Direction" do

    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(base_writing_direction: 1).class.should == NSMutableParagraphStyle
    end

    it "should understand natural" do
      @builder.paragraph_style_attribute(base_writing_direction: :natural).baseWritingDirection.should == NSWritingDirectionNatural
      @builder.paragraph_style_attribute(base_writing_direction: :default).baseWritingDirection.should == NSWritingDirectionNatural
    end

    it "should understand left to right" do
      @builder.paragraph_style_attribute(base_writing_direction: :left).baseWritingDirection.should == NSWritingDirectionLeftToRight
      @builder.paragraph_style_attribute(base_writing_direction: :left_to_right).baseWritingDirection.should == NSWritingDirectionLeftToRight
      @builder.paragraph_style_attribute(base_writing_direction: :l2r).baseWritingDirection.should == NSWritingDirectionLeftToRight
    end

    it "should understand right to left" do
      @builder.paragraph_style_attribute(base_writing_direction: :right).baseWritingDirection.should == NSWritingDirectionRightToLeft
      @builder.paragraph_style_attribute(base_writing_direction: :right_to_left).baseWritingDirection.should == NSWritingDirectionRightToLeft
      @builder.paragraph_style_attribute(base_writing_direction: :r2l).baseWritingDirection.should == NSWritingDirectionRightToLeft
    end

    it "should allow various shades of nothingness" do
      default = NSParagraphStyle.defaultParagraphStyle.mutableCopy
      @builder.paragraph_style_attribute(base_writing_direction: 0).baseWritingDirection.should == default.baseWritingDirection
      @builder.paragraph_style_attribute(base_writing_direction: :lulz).baseWritingDirection.should == default.baseWritingDirection
    end
  end

  describe "With Line Height Multiple" do
    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(line_height_multiple: 1).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(line_height_multiple: -2).lineHeightMultiple.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(line_height_multiple: 4.0).lineHeightMultiple.should == 4.0
    end

    it "should allow various shades of nothingness" do
      @builder.paragraph_style_attribute(line_height_multiple: 0).lineHeightMultiple.should == 0
      @builder.paragraph_style_attribute(line_height_multiple: :default).lineHeightMultiple.should == 0
    end
  end

  describe "With Default Tab Interval" do
    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(default_tab_interval: 1).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(default_tab_interval: -2).defaultTabInterval.should == 0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(default_tab_interval: 4.0).defaultTabInterval.should == 4.0
    end

    it "should allow various shades of nothingness" do
      @builder.paragraph_style_attribute(default_tab_interval: 0).defaultTabInterval.should == 0
      @builder.paragraph_style_attribute(default_tab_interval: :default).defaultTabInterval.should == 0
    end
  end

  describe "With Hyphenation Factor" do
    it "should return a NSMutableParagraphStyle" do
      @builder.paragraph_style_attribute(hyphenation_factor: 1).class.should == NSMutableParagraphStyle
    end

    it "should not be negative" do
      @builder.paragraph_style_attribute(hyphenation_factor: -2).hyphenationFactor.should == 0
    end

    it "should not be more than 1" do
      @builder.paragraph_style_attribute(hyphenation_factor: 2.0).hyphenationFactor.should == 1.0
    end

    it "should be set with valid floats" do
      @builder.paragraph_style_attribute(hyphenation_factor: 0.5).hyphenationFactor.should == 0.5
    end

    it "should allow various shades of nothingness" do
      @builder.paragraph_style_attribute(hyphenation_factor: 0).hyphenationFactor.should == 0
      @builder.paragraph_style_attribute(hyphenation_factor: :default).hyphenationFactor.should == 0
    end
  end


end
