describe "Font Attribute" do

  before do
    @builder = MotionMastr::Builder.new
    @font = UIFont.systemFontOfSize(30)
  end

  it "should return nil if given nil" do
    @builder.font_attribute(nil).should == nil
  end

  it "should return nil if :font is nil" do
    @builder.font_attribute(font: nil).should == nil
  end

  it "should return nil if :font is a number" do
    @builder.font_attribute(font: 69).should == nil
  end

  it "should return the UIFont passed" do
    @builder.font_attribute(font: @font).should == @font
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", font: @font).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSFontAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @font
  end

end
