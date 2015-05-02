describe "Underline Color" do

  before do
    @builder = MotionMastr::Builder.new
    @sample = UIColor.redColor
  end

  it "should return nil if given nil" do
    @builder.underline_color_attribute(nil).should == nil
  end

  it "should return nil if :underline_color is nil" do
    @builder.underline_color_attribute(underline_color: nil).should == nil
  end

  it "should return nil if :underline_color is a number" do
    @builder.underline_color_attribute(underline_color: 69).should == nil
  end

  it "should return the underline color passed" do
    @builder.underline_color_attribute(underline_color: @sample).should == @sample
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", underline_color: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSUnderlineColorAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @sample
  end

end
