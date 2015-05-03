describe "Link Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
  end

  it "should return nil if given nil" do
    @builder.link_attribute(nil).should == nil
  end

  it "should assign a string link" do
    s = "http://infinitered.com"
    @builder.link_attribute(link: s).should == s
  end

  it "should assign an NSURL link" do
    s = NSURL.URLWithString("http://infinitered.com")
    @builder.link_attribute(link: s).should == s
  end

  it "should shun the outsiders" do
    @builder.link_attribute(link: Kernel).should == nil
    @builder.link_attribute(link: nil).should == nil
    @builder.link_attribute(link: :hey).should == nil
  end

  it "should get applied through the builder" do
    s = NSURL.URLWithString("http://infinitered.com")
    as = @builder.add("a").add("b", link: s).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSLinkAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == s
  end

end
