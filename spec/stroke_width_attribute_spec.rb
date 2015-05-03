describe "Stroke Width Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given nil" do
    @builder.stroke_width_attribute(nil).should == nil
  end

  it "should set the default" do
    @builder.stroke_width_attribute(stroke_width: 0).should == 0
    @builder.stroke_width_attribute(stroke_width: :default).should == 0
  end

  it "should change to a float value" do
    @builder.stroke_width_attribute(stroke_width: 1.0).should == 1.0
    @builder.stroke_width_attribute(stroke_width: -1.0).should == -1.0
  end

  it "should reject invalid attributes" do
    @builder.stroke_width_attribute(stroke_width: "lulz").should == 0
    @builder.stroke_width_attribute(stroke_width: nil).should == nil
    @builder.stroke_width_attribute(stroke_width: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", stroke_width: 1).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSStrokeWidthAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == 1.0
  end

end
