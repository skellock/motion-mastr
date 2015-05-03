describe "Strikethrough Style" do

  before do
    @builder = MotionMastr::MastrBuilder.new
    @sample = :single
  end

  it "should return nil if given nil" do
    @builder.strikethrough_style_attribute(nil).should == nil
  end

  it "should return nil if :strikethrough_style is nil" do
    @builder.strikethrough_style_attribute(strikethrough_style: nil).should == nil
  end

  it "should return nil if :strikethrough_style is a number" do
    @builder.strikethrough_style_attribute(strikethrough_style: 69).should == nil
  end

  it "should get applied throught the builder" do
    as = @builder.add("a").add("b", strikethrough_style: @sample).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSStrikethroughStyleAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == NSUnderlineStyleSingle
  end

end
