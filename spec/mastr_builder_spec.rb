describe "MastrBuilder" do

  before do
    @builder = MotionMastr::MastrBuilder.new
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

  it "should remember default styles" do
    MotionMastr::MastrBuilder.new(hi: "there").default_styles[:hi].should == "there"
  end

  it "should allow configuring of default styles via an indexer" do
    @builder[:hi] = "hey"
    @builder.default_styles[:hi].should == "hey"
  end

  it "should read from default styles via an indexer" do
    MotionMastr::MastrBuilder.new(hi: "there")[:hi].should == "there"
  end

  describe "With Default Styling" do

    before do
      @default_font = UIFont.systemFontOfSize(10)
      @specific_font = UIFont.systemFontOfSize(20)
      @builder[:font] = @default_font
      @builder.add "a"
      @builder.add "b", font: @specific_font
      @builder.add "c"
      @as = @builder.build
    end

    it "should fall back to default attributes" do
      @as.attributesAtIndex(0, effectiveRange:nil).values[0].should == @default_font
      @as.attributesAtIndex(2, effectiveRange:nil).values[0].should == @default_font
    end

    it "should not overrite specific attributes with default attributes" do
      @as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @specific_font
    end

  end

  describe "With Simple Styling" do

    before do
      @font = UIFont.systemFontOfSize(60)
      @builder.add "hello"
      @builder.add "world", font: @font
      @as = @builder.build
    end

    it "shouldn't apply attributes in the wrong spot" do
      @as.attributesAtIndex(1, effectiveRange:nil).length.should == 0
    end

    it "should apply attributes in the right spot" do
      @as.attributesAtIndex(7, effectiveRange:nil).length.should == 1
      @as.attributesAtIndex(7, effectiveRange:nil).keys[0].should == NSFontAttributeName
      @as.attributesAtIndex(7, effectiveRange:nil).values[0].should == @font
    end

  end

end
