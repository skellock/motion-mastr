describe "Font Attribute" do

  before do
    @builder = MotionMastr::Builder.new
  end

  it "should return nil if given nil" do
    @builder.font_attribute(nil).should == nil
  end

  it "should return nil if :font is nil" do
    @builder.font_attribute(font: nil).should == nil
  end

  it "should return nil if :font is a number" do
    @builder.font_attribute(font: 69).should == nil
  end

  it "should return the UIFont passed" do
    sample = UIFont.new
    @builder.font_attribute(font: sample).should == sample
  end

end
