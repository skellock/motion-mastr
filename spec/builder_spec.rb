describe "Builder" do

  describe "Fresh Instance" do

    before do
      @builder = MotionMastr::Builder.new
    end

    it "should build an NSMutableAttributedString" do
      @builder.build.is_a?(NSMutableAttributedString).should == true
    end

    it "should be empty" do
      @builder.build.length.should == 0
    end

  end

end
