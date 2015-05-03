describe "Attachment Attribute" do

  before do
    @builder = MotionMastr::MastrBuilder.new
    @attachment = NSTextAttachment.alloc.init
  end

  it "should return nil if given nil" do
    @builder.attachment_attribute(nil).should == nil
  end

  it "should assign an attachment" do
    @builder.attachment_attribute(attachment: @attachment).should == @attachment
  end

  it "should reject imposters" do
    @builder.attachment_attribute(attachment: "lulz").should == nil
    @builder.attachment_attribute(attachment: nil).should == nil
    @builder.attachment_attribute(attachment: :hey).should == nil
  end

  it "should get applied through the builder" do
    as = @builder.add("a").add("b", attachment: @attachment).build
    as.attributesAtIndex(1, effectiveRange:nil).keys[0].should == NSAttachmentAttributeName
    as.attributesAtIndex(1, effectiveRange:nil).values[0].should == @attachment
  end

end
