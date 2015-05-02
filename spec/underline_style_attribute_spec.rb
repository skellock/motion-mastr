describe "Underline Style" do

  before do
    @builder = MotionMastr::Builder.new
    @sample = :single
  end

  it "should return nil if given nil" do
    @builder.underline_style_attribute(nil).should == nil
  end

  it "should return nil if :underline_style is nil" do
    @builder.underline_style_attribute(underline_style: nil).should == nil
  end

  it "should return nil if :underline_style is a number" do
    @builder.underline_style_attribute(underline_style: 69).should == nil
  end

  it "should support :none" do
    @builder.underline_style_attribute(underline_style: :none).should == NSUnderlineStyleNone
    @builder.underline_style_attribute(underline_style: :style_none).should == NSUnderlineStyleNone
  end

  it "should support :single" do
    @builder.underline_style_attribute(underline_style: :single).should == NSUnderlineStyleSingle
    @builder.underline_style_attribute(underline_style: :style_single).should == NSUnderlineStyleSingle
  end

  it "should support :thick" do
    @builder.underline_style_attribute(underline_style: :thick).should == NSUnderlineStyleThick
    @builder.underline_style_attribute(underline_style: :style_thick).should == NSUnderlineStyleThick
  end

  it "should support :double" do
    @builder.underline_style_attribute(underline_style: :double).should == NSUnderlineStyleDouble
    @builder.underline_style_attribute(underline_style: :style_double).should == NSUnderlineStyleDouble
  end

  it "should support :solid" do
    @builder.underline_style_attribute(underline_style: :solid).should == NSUnderlinePatternSolid
    @builder.underline_style_attribute(underline_style: :pattern_solid).should == NSUnderlinePatternSolid
  end

  it "should support :dot" do
    @builder.underline_style_attribute(underline_style: :dot).should == NSUnderlinePatternDot
    @builder.underline_style_attribute(underline_style: :pattern_dot).should == NSUnderlinePatternDot
  end

  it "should support :dash" do
    @builder.underline_style_attribute(underline_style: :dash).should == NSUnderlinePatternDash
    @builder.underline_style_attribute(underline_style: :pattern_dash).should == NSUnderlinePatternDash
  end

  it "should support :dash_dot" do
    @builder.underline_style_attribute(underline_style: :dash_dot).should == NSUnderlinePatternDashDot
    @builder.underline_style_attribute(underline_style: :pattern_dash_dot).should == NSUnderlinePatternDashDot
  end

  it "should support :dash_dot_dot" do
    @builder.underline_style_attribute(underline_style: :dash_dot_dot).should == NSUnderlinePatternDashDotDot
    @builder.underline_style_attribute(underline_style: :pattern_dash_dot_dot).should == NSUnderlinePatternDashDotDot
  end

  it "should support :by_word" do
    @builder.underline_style_attribute(underline_style: :by_word).should == NSUnderlineByWord
  end

  it "should support an Array of symbols" do
    @builder.underline_style_attribute(underline_style: [:single, :dash]).should == NSUnderlineStyleSingle | NSUnderlinePatternDash
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", underline_style: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSUnderlineStyleAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == NSUnderlineStyleSingle
  end

end
