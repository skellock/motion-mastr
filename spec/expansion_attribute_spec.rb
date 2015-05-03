describe "Expansion Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given nil" do
    @builder.expansion_attribute(nil).should == nil
  end

  it "should set the default" do
    @builder.expansion_attribute(expansion: 0).should == 0
    @builder.expansion_attribute(expansion: :default).should == 0
  end

  it "should change to a float value" do
    @builder.expansion_attribute(expansion: 1.0).should == 1.0
    @builder.expansion_attribute(expansion: -1.0).should == -1.0
  end

  it "should reject invalid attributes" do
    @builder.expansion_attribute(expansion: "lulz").should == 0
    @builder.expansion_attribute(expansion: nil).should == nil
    @builder.expansion_attribute(expansion: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", expansion: 1).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSExpansionAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == 1.0
  end

end
