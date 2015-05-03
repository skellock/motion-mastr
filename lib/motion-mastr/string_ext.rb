class String

  def mastr(default_styles={})
    builder = MotionMastr::Builder.new(default_styles)
    builder.add self
    builder
  end

  def mastr!(default_styles={})
    mastr(default_styles).build
  end

end
