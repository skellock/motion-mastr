describe "Builder" do

  before do
    @builder = MotionMastr::Builder.new
  end

  it "should build an NSMutableAttributedString" do
    @builder.build.is_a?(NSMutableAttributedString).should == true
  end

  it "should build a 0 length NSMutableAttributedString when empty" do
    @builder.build.length.should == 0
  end

  it "should start with no default styles" do
    @builder.default_styles.keys.length.should == 0
  end

  it "should chain itself when adding" do
    @builder.add("hi").should == @builder
  end

  it "should not add nil text" do
    @builder.add(nil).pieces.count.should == 0
  end

  it "should add valid text to the pieces" do
    @builder.add("hi").pieces.count.should == 1
  end

  it "should build unstyled text" do
    @builder.add("hey").build.string.should == "hey"
  end

  it "should join unstyled pieces together" do
    @builder.add("a").add("b").add("c").build.string.should == "abc"
  end

end
