describe "Ligature Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given nil" do
    @builder.ligature_attribute(nil).should == nil
  end

  it "should turn ligature off" do
    @builder.ligature_attribute(ligature: 0).should == 0
    @builder.ligature_attribute(ligature: :off).should == 0
    @builder.ligature_attribute(ligature: :none).should == 0
  end

  it "should turn ligature on" do
    @builder.ligature_attribute(ligature: 1).should == 1
    @builder.ligature_attribute(ligature: :on).should == 1
    @builder.ligature_attribute(ligature: :default).should == 1
  end

  it "should reject invalid attributes" do
    @builder.ligature_attribute(ligature: "lulz").should == nil
    @builder.ligature_attribute(ligature: nil).should == nil
    @builder.ligature_attribute(ligature: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", ligature: :on).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSLigatureAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == 1
  end

end
