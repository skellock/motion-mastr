class String

  def mastr
    builder = MotionMastr::Builder.new
    builder.add self
    builder
  end

  def mastr!
    mastr.build
  end

end
