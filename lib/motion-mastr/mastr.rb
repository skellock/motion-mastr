module MotionMastr

  # make a MastrBuilder
  def mastr(text=nil, default_styles={})
    b = MastrBuilder.new default_styles
    b.add text
    b
  end

  # make and build a NSMutableAttributedString
  def mastr!(text=nil, default_styles={})
    mastr(text, default_styles).build
  end

end
