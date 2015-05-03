describe "Strikethrough Color" do

  before do
    @builder = MotionMastr::MastrBuilder.new
    @sample = UIColor.redColor
  end

  it "should return nil if given nil" do
    @builder.strikethrough_color_attribute(nil).should == nil
  end

  it "should return nil if :strikethrough_color is nil" do
    @builder.strikethrough_color_attribute(strikethrough_color: nil).should == nil
  end

  it "should return nil if :strikethrough_color is a number" do
    @builder.strikethrough_color_attribute(strikethrough_color: 69).should == nil
  end

  it "should return the strikethrough color passed" do
    @builder.strikethrough_color_attribute(strikethrough_color: @sample).should == @sample
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", strikethrough_color: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSStrikethroughColorAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @sample
  end

end
