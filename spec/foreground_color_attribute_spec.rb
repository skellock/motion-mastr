describe "Foreground Color" do

  before do
    @builder = MotionMastr::MastrBuilder.new
    @sample = UIColor.redColor
  end

  it "should return nil if given nil" do
    @builder.foreground_color_attribute(nil).should == nil
  end

  it "should return nil if :foreground_color is nil" do
    @builder.foreground_color_attribute(foreground_color: nil).should == nil
  end

  it "should return nil if :foreground_color is a number" do
    @builder.foreground_color_attribute(foreground_color: 69).should == nil
  end

  it "should return the foreground color passed" do
    @builder.foreground_color_attribute(foreground_color: @sample).should == @sample
  end

  it "should also support being called :color" do
    @builder.foreground_color_attribute(color: @sample).should == @sample
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", foreground_color: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSForegroundColorAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @sample
  end

end
