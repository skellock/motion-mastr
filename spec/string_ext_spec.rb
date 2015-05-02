describe "String Extensions" do

  it "adds a String#mastr method" do
    "".respond_to?(:mastr).should == true
  end

end
