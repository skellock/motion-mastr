describe "Kern Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given nil" do
    @builder.kern_attribute(nil).should == nil
  end

  it "should support being called :kerning" do
    @builder.kern_attribute(kerning: 0).should == 0
  end

  it "should turn kern off" do
    @builder.kern_attribute(kern: 0).should == 0
    @builder.kern_attribute(kern: :off).should == 0
    @builder.kern_attribute(kern: :default).should == 0
    @builder.kern_attribute(kern: :none).should == 0
  end

  it "should turn on kerning with Fixnums" do
    @builder.kern_attribute(kern: 1).should == 1.0
  end

  it "should turn on kerning with Floats" do
    @builder.kern_attribute(kern: 1.0).should == 1.0
  end

  it "should turn onn kerning with Strings" do
    @builder.kern_attribute(kern: "1").should == 1.0
  end

  it "should dodge nils" do
    @builder.kern_attribute(kern: nil).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", kern: 4.0).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSKernAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == 4.0
  end

end
