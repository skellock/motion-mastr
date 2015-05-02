describe "Shadow Attribute" do

  before do
    @builder = MotionMastr::Builder.new
  end

  it "should return nil if given no styles" do
    @builder.shadow_attribute(nil).should == nil
  end

  it "should return nil if no shadow attributes are given" do
    @builder.shadow_attribute({}).should == nil
  end

  describe "Offset" do

    it "should return a NSShadow" do
      @builder.shadow_attribute(shadow_offset: [1, 1]).class.should == NSShadow
    end

    it "should support CGSizes" do
      s = CGSizeMake(4, 4)
      @builder.shadow_attribute(shadow_offset: s).shadowOffset.should == s
    end

    it "should support 2-length'd arrays" do
      s = [2, 4]
      @builder.shadow_attribute(shadow_offset: s).shadowOffset.should == CGSizeMake(2, 4)
    end

    it "should support Fixnums" do
      s = 4
      @builder.shadow_attribute(shadow_offset: s).shadowOffset.should == CGSizeMake(4, 4)
    end

    it "should support Floats" do
      s = 4.4
      @builder.shadow_attribute(shadow_offset: s).shadowOffset.should == CGSizeMake(4.4, 4.4)
    end

  end

  describe "Blur Radius" do

    it "should return a NSShadow" do
      @builder.shadow_attribute(shadow_blur_radius: 2).class.should == NSShadow
    end

    it "should support nothingness" do
      @builder.shadow_attribute(shadow_blur_radius: 0).shadowBlurRadius.should == 0
      @builder.shadow_attribute(shadow_blur_radius: :none).shadowBlurRadius.should == 0
      @builder.shadow_attribute(shadow_blur_radius: :default).shadowBlurRadius.should == 0
      @builder.shadow_attribute(shadow_blur_radius: :off).shadowBlurRadius.should == 0
    end

    it "should support positive numbers" do
      @builder.shadow_attribute(shadow_blur_radius: 1.0).shadowBlurRadius.should == 1.0
      @builder.shadow_attribute(shadow_blur_radius: 2).shadowBlurRadius.should == 2.0
    end

    it "should prevent negative numbers" do
      @builder.shadow_attribute(shadow_blur_radius: -1).shadowBlurRadius.should == 0
    end

  end

  describe "Color" do

    it "should return a NSShadow" do
      @builder.shadow_attribute(shadow_color: UIColor.redColor).class.should == NSShadow
    end

    it "should support colours" do
      c = UIColor.redColor
      @builder.shadow_attribute(shadow_color: c).shadowColor.should == c
    end

    it "should prevent crap" do
      default = NSShadow.alloc.init
      @builder.shadow_attribute(shadow_color: 1.0).shadowColor.should == default.shadowColor
      @builder.shadow_attribute(shadow_color: nil).shadowColor.should == default.shadowColor
    end

  end

end
