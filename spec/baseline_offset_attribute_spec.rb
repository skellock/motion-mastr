describe "Baseline Offset Attribute" do

  before do
    @builder = MotionMastr::Builder.new
  end

  it "should return nil if given nil" do
    @builder.baseline_offset_attribute(nil).should == nil
  end

  it "should set the default" do
    @builder.baseline_offset_attribute(baseline_offset: 0).should == 0
    @builder.baseline_offset_attribute(baseline_offset: :default).should == 0
  end

  it "should change to a float value" do
    @builder.baseline_offset_attribute(baseline_offset: 1.0).should == 1.0
    @builder.baseline_offset_attribute(baseline_offset: -1.0).should == -1.0
  end

  it "should reject invalid attributes" do
    @builder.baseline_offset_attribute(baseline_offset: "lulz").should == 0
    @builder.baseline_offset_attribute(baseline_offset: nil).should == nil
    @builder.baseline_offset_attribute(baseline_offset: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", baseline_offset: 1).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSBaselineOffsetAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == 1.0
  end

end
