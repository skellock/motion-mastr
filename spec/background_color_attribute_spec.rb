describe "Background Color" do

  before do
    @builder = MotionMastr::MastrBuilder.new
    @sample = UIColor.redColor
  end

  it "should return nil if given nil" do
    @builder.background_color_attribute(nil).should == nil
  end

  it "should return nil if :background_color is nil" do
    @builder.background_color_attribute(background_color: nil).should == nil
  end

  it "should return nil if :background_color is a number" do
    @builder.background_color_attribute(background_color: 69).should == nil
  end

  it "should return the background color passed" do
    @builder.background_color_attribute(background_color: @sample).should == @sample
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", background_color: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSBackgroundColorAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @sample
  end

end
