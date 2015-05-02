describe "Obliqueness Attribute" do

  before do
    @builder = MotionMastr::Builder.new
  end

  it "should return nil if given nil" do
    @builder.obliqueness_attribute(nil).should == nil
  end

  it "should set the default" do
    @builder.obliqueness_attribute(obliqueness: 0).should == 0
    @builder.obliqueness_attribute(obliqueness: :default).should == 0
  end

  it "should change to a float value" do
    @builder.obliqueness_attribute(obliqueness: 1.0).should == 1.0
    @builder.obliqueness_attribute(obliqueness: -1.0).should == -1.0
  end

  it "should reject invalid attributes" do
    @builder.obliqueness_attribute(obliqueness: "lulz").should == 0
    @builder.obliqueness_attribute(obliqueness: nil).should == nil
    @builder.obliqueness_attribute(obliqueness: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", obliqueness: 1).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSObliquenessAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == 1.0
  end

end
