describe "String Extensions" do

  it "adds a String#mastr method" do
    "".respond_to?(:mastr).should == true
  end

  it "adds a String#mastr! method" do
    "".respond_to?(:mastr!).should == true
  end

  it "#mastr supports passing default styles" do
    "hi".mastr(obliqueness: 3).build.attributesAtIndex(0, effectiveRange:nil).keys[0].should == NSObliquenessAttributeName
  end

  it "#mastr! supports passing default styles" do
    "hi".mastr!(obliqueness: 3).attributesAtIndex(0, effectiveRange:nil).keys[0].should == NSObliquenessAttributeName
  end

end
