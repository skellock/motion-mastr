describe "Stroke Color" do

  before do
    @builder = MotionMastr::MastrBuilder.new
    @sample = UIColor.redColor
  end

  it "should return nil if given nil" do
    @builder.stroke_color_attribute(nil).should == nil
  end

  it "should return nil if :stroke_color is nil" do
    @builder.stroke_color_attribute(stroke_color: nil).should == nil
  end

  it "should return nil if :stroke_color is a number" do
    @builder.stroke_color_attribute(stroke_color: 69).should == nil
  end

  it "should return the stroke color passed" do
    @builder.stroke_color_attribute(stroke_color: @sample).should == @sample
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", stroke_color: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSStrokeColorAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @sample
  end

end
