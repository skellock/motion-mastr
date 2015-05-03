describe "mastr" do

  extend MotionMastr

  it "shouldn't require parameters" do
    mastr.class.should == MotionMastr::MastrBuilder
  end

  it "should pass along text" do
    mastr("hi").pieces.length.should == 1
  end

  it "should pass along default styles" do
    mastr("hi", obliqueness: 1).default_styles.keys.count.should == 1
  end

end

describe "mastr!" do

  extend MotionMastr

  it "shouldn't require parameters" do
    mastr!.class.should == NSConcreteMutableAttributedString
  end

  it "should pass along text" do
    mastr!("hi").string.should == "hi"
  end

  it "should pass along default styles" do
    mastr!("hi", obliqueness: 1).attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSObliquenessAttributeName
  end

end
