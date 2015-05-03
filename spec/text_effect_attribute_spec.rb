describe "Text Effect Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given nil" do
    @builder.text_effect_attribute(nil).should == nil
  end

  it "should properly set letterpress" do
    @builder.text_effect_attribute(text_effect: :letterpress).should == NSTextEffectLetterpressStyle
    @builder.text_effect_attribute(text_effect: :letterpress_style).should == NSTextEffectLetterpressStyle
  end

  it "should reject invalid attributes" do
    @builder.text_effect_attribute(text_effect: "lulz").should == nil
    @builder.text_effect_attribute(text_effect: nil).should == nil
    @builder.text_effect_attribute(text_effect: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", text_effect: :letterpress).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSTextEffectAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == NSTextEffectLetterpressStyle
  end

end
